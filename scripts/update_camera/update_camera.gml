/// @function update_camera(angle, radius, headfirst, getting_up_time)
/// @param {real} angle
/// @param {real} radius
/// @param {boolean} headfirst;
/// @param {real} getting_up_time;

var CAMERA_SHIFT = global.WALL_RADIUS/4;

var angle = argument0;
var radius = argument1;
var headfirst = argument2;
var getting_up_time = argument3;

if(headfirst or getting_up_time >= 0){
	angle += 180;
	radius *= -1;
}
if(getting_up_time >= 0){
	angle += getting_up_time;
	var rad_inc = -radius*2/180;
	radius += rad_inc*getting_up_time;
}

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