var RADIUS_INCREMENT = global.WALL_RADIUS/800;
var ANGLE_INCREMENT = 500/global.WALL_RADIUS;
var GRAVITY_FACTOR = global.WALL_RADIUS * 4;

// stop velocity if not falling
var is_falling = not on_floor and not on_ladder and not on_ledge;
vel_radius *= is_falling;
vel_angle *= is_falling;

// register inputs
if not is_falling {
	var move_left = keyboard_check(vk_left);
	var move_right = keyboard_check(vk_right);
	var move_up = keyboard_check(vk_up);
	var move_down = keyboard_check(vk_down) and pos_radius < global.MAX_RADIUS;
	var jump = keyboard_check_pressed(vk_space);
	
	vel_angle += (move_right - move_left) * ANGLE_INCREMENT;
	pos_radius += on_floor * (move_down - move_up) * RADIUS_INCREMENT;
	obj_depth = max(obj_depth + (move_down - move_up) * RADIUS_INCREMENT * on_floor, 0)
	pos_radius += on_ladder * (move_down - move_up) * RADIUS_INCREMENT*2;
	vel_radius -= jump * RADIUS_INCREMENT*5;
}

// apply gravity
var gravity_force = pos_radius/GRAVITY_FACTOR;
vel_radius += is_falling * gravity_force;

// apply velocity
pos_radius = min(pos_radius+vel_radius, obj_depth+global.WALL_RADIUS);
pos_angle += vel_angle;

// update sprite position, angle
depth = -obj_depth;
var coordinates = convert_polar(pos_angle, pos_radius, obj_depth);
x = coordinates[0];
y = coordinates[1];
image_angle = coordinates[2];
image_xscale = coordinates[3];
image_yscale = coordinates[3];
on_floor = is_on_floor(pos_radius, obj_depth);
on_ladder = false;
on_ledge = false;