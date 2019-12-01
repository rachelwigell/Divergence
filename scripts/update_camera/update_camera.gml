/// @function update_camera()

var CAMERA_SHIFT = global.WALL_RADIUS/4;

with(obj_niko){
	var angle = pos_angle;
	var radius = pos_radius;
	
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
	var coordinates = convert_polar(angle, camera_radius);
	var camera_x = coordinates[0];
	var camera_y = coordinates[1];
	camera_x -= camera_get_view_width(view_camera[0])/2;
	camera_y -= camera_get_view_height(view_camera[0])/2;
	var camera_angle = -angle-90;

	camera_set_view_pos(
		view_camera[0],
		camera_x,
		camera_y
	);
	camera_set_view_angle(view_camera[0], camera_angle);
}

