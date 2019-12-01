/// @function register_inputs()

var max_vel_angle = global.CIRCUMFERENCE_INCREMENT/pos_radius*3 * (global.fast_mode + 1);
var angle_increment = global.CIRCUMFERENCE_INCREMENT/pos_radius * (global.fast_mode + 1);

var can_move = getting_up_time < 0;
var move_left = keyboard_check(vk_left) and can_move;
var move_right = keyboard_check(vk_right) and can_move;
var move_up = keyboard_check(vk_up) and on_ladder and can_move;
var move_down = keyboard_check(vk_down) and not on_floor and can_move;
var jump = keyboard_check_pressed(vk_space) and (on_floor or on_ledge);

if is_falling{
	var angle_deceleration_factor = 1;
	var acceleration_control_factor = .3;
}
else{
	var angle_deceleration_factor = .8;
	var acceleration_control_factor = 1;
}

// set velocities
vel_angle = clamp(vel_angle*angle_deceleration_factor +
	(move_right - move_left)*acceleration_control_factor*angle_increment,
	-max_vel_angle, max_vel_angle);
pos_radius += (move_down - move_up) * global.RADIUS_INCREMENT*2;
vel_radius -= jump * global.RADIUS_INCREMENT*5;