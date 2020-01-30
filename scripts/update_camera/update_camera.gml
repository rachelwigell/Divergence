/// @function update_camera()

var CAMERA_SHIFT = global.VIEWPORT_SIZE/3;

with(obj_niko){
	var angle = pos_angle;
	var radius = pos_radius;
	var camera_radius = radius - CAMERA_SHIFT;
	
	if(global.platforming_scene){
		var fall_stunned = fall_stun_time > 0;
		var getting_up = getting_up_time >= 0;
	
		if(headfirst or fall_stunned or getting_up){
			var camera_radius = radius + CAMERA_SHIFT;
		}
		if(getting_up){
			var rad_inc = (CAMERA_SHIFT*2)/180;
			camera_radius -= rad_inc*getting_up_time;
		}
	}

	var coordinates = convert_polar(angle, camera_radius);
	var camera_x = coordinates[0];
	var camera_y = coordinates[1];
	camera_x -= camera_get_view_width(view_camera[0])/2;
	camera_y -= camera_get_view_height(view_camera[0])/2;
	var camera_angle = -angle-90;
	
	if(global.platforming_scene){
		if(headfirst or fall_stunned or getting_up){
			camera_angle += 180;
		}
		if(getting_up){
			camera_angle += getting_up_time;
		}
	}
	
	camera_set_view_pos(
		view_camera[0],
		camera_x,
		camera_y
	);
	camera_set_view_angle(view_camera[0], camera_angle);
}

