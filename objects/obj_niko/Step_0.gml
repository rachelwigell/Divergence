var max_vel_angle = global.CIRCUMFERENCE_INCREMENT/pos_radius*3 * (global.fast_mode + 1);
var angle_increment = global.CIRCUMFERENCE_INCREMENT/pos_radius * (global.fast_mode + 1);

var on_floor = pos_radius >= global.WALL_RADIUS or
	place_meeting(x, y, obj_collidable);
if(on_floor and headfirst){
	getting_up_time = 0;
	headfirst = false;
}

var wall = noone;
with(obj_wall){
	wall = id;
}

//check for collisions with ladders
on_ladder = false;
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
on_ledge = false;
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
		if(headfirst){
			getting_up_time = 0;
			headfirst = false;
		}
   }
}

// stop velocity if not falling
var is_falling = not on_floor and not on_ladder and not on_ledge;
if is_falling{
	var angle_deceleration_factor = 1;
	var acceleration_control_factor = .3;
}
else{
	var angle_deceleration_factor = .8;
	var acceleration_control_factor = 1;
}
vel_radius *= is_falling;

// register inputs
var move_left = keyboard_check(vk_left);
var move_right = keyboard_check(vk_right);
var move_up = keyboard_check(vk_up) and on_ladder;
var move_down = keyboard_check(vk_down) and pos_radius < global.WALL_RADIUS;
var jump = keyboard_check_pressed(vk_space);
	
vel_angle = clamp(vel_angle*angle_deceleration_factor +
	(move_right - move_left)*acceleration_control_factor*angle_increment,
	-max_vel_angle, max_vel_angle);
pos_radius += (move_down - move_up) * global.RADIUS_INCREMENT*2;
vel_radius -= jump * global.RADIUS_INCREMENT*5;

// apply gravity
var gravity_force = pos_radius/global.GRAVITY_FACTOR;
vel_radius += is_falling * gravity_force;

// apply velocity
pos_radius = min(pos_radius+vel_radius, global.WALL_RADIUS);
pos_angle = pos_angle+vel_angle;

// keep angle within 0-360 and radius within 0-WALL_RADIUS
if(pos_radius < 0){
	pos_radius *= -1;
	pos_angle += 180;
	vel_radius *= -1;
	headfirst = true;
}
if(pos_angle >= 360){
	pos_angle -= 360;
}
else if(pos_angle < 0){
	pos_angle += 360;
}

// increment getting_up_time as needed
if(getting_up_time >= 0){
	getting_up_time++;
	if(getting_up_time > 180){
		getting_up_time = -1;
	}
}

var coordinates = convert_polar(pos_angle, pos_radius, headfirst, getting_up_time);

// update sprite position, angle
x = coordinates[0];
y = coordinates[1];
image_angle = coordinates[2];