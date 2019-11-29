var RADIUS_INCREMENT = global.WALL_RADIUS/800;
var ANGLE_INCREMENT = 100/global.WALL_RADIUS;
var GRAVITY_FACTOR = global.WALL_RADIUS * 4;
var MAX_VEL_ANGLE = .5;

var on_floor = pos_radius >= global.WALL_RADIUS or
	place_meeting(x, y, obj_collidable);
var on_ladder = false;
var on_ledge = false;

var wall = noone;
with(obj_wall){
	wall = id;
}

//check for collisions with ladders
for (var i=0; i<array_length_1d(wall.ladder_locations); i++) {
   var ladder = wall.ladder_locations[i];
   var ladder_angle = ladder[0];
   var ladder_top = ladder[1];
   var ladder_bottom = ladder[2];
   if(pos_angle - global.LADDER_WIDTH/2 <= ladder_angle and
      pos_angle + global.LADDER_WIDTH/2 >= ladder_angle and
	  pos_radius <= ladder_bottom and
	  pos_radius >= ladder_top){
		on_ladder = true;
   }
}

//check for collisions with ledges
for (var i=0; i<array_length_1d(wall.ledge_locations); i++) {
   var ledge = wall.ledge_locations[i];
   var ledge_radius = ledge[0];
   var ledge_left = ledge[1];
   var ledge_right = ledge[2];
   if(pos_angle >= ledge_left and
      pos_angle <= ledge_right and
	  pos_radius - global.LEDGE_TOLERANCE <= ledge_radius and
	  pos_radius + global.LEDGE_TOLERANCE >= ledge_radius){
		on_ledge = true;
   }
}

// stop velocity if not falling
var is_falling = not on_floor and not on_ladder and not on_ledge;
if is_falling{
	var angle_deceleration_factor = .99;
}
else{
	var angle_deceleration_factor = .8;
}
	
vel_radius *= is_falling;

// register inputs

var move_left = keyboard_check(vk_left);
var move_right = keyboard_check(vk_right);
var move_up = keyboard_check(vk_up) and on_ladder;
var move_down = keyboard_check(vk_down) and pos_radius < global.WALL_RADIUS;
var jump = keyboard_check_pressed(vk_space);
	
vel_angle = clamp(vel_angle*angle_deceleration_factor + (move_right - move_left) * ANGLE_INCREMENT, -MAX_VEL_ANGLE, MAX_VEL_ANGLE);
pos_radius += (move_down - move_up) * RADIUS_INCREMENT*2;
vel_radius -= jump * RADIUS_INCREMENT*5;


// apply gravity
var gravity_force = pos_radius/GRAVITY_FACTOR;
vel_radius += is_falling * gravity_force;

// apply velocity
pos_radius = min(pos_radius+vel_radius, global.WALL_RADIUS);
pos_angle = pos_angle+vel_angle;
var coordinates = convert_polar(pos_angle, pos_radius);

// update sprite position, angle
x = coordinates[0];
y = coordinates[1];
image_angle = coordinates[2];