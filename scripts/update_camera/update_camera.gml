/// @function update_camera(angle, radius, obj_depth)
/// @param {real} angle
/// @param {real} radius
/// @param {real} obj_depth

var CAMERA_SHIFT = global.WALL_RADIUS/5;

var angle = argument0;
var radius = argument1;
var obj_depth = argument2;

var camera_radius = min(radius - CAMERA_SHIFT, global.WALL_RADIUS - CAMERA_SHIFT);
var camera_x = room_width/2 + dcos(angle) * camera_radius;
camera_x -= camera_get_view_width(view_camera[0])/2;
var camera_y = room_height/2 - dsin(angle) * camera_radius;
camera_y -= camera_get_view_height(view_camera[0])/2;
var camera_angle = -angle-90;

camera_set_view_pos(
	view_camera[0],
	camera_x,
	camera_y
);
camera_set_view_angle(view_camera[0], camera_angle);