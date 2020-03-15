/// @function update_camera()

var SCREEN_WIDTH = camera_get_view_width(view_camera[0]);
var SCREEN_HEIGHT = camera_get_view_height(view_camera[0])
var CAMERA_SHIFT = SCREEN_HEIGHT/3;


with(obj_niko){
	var angle = pos_angle;
	var radius = pos_radius;
	var camera_radius = radius - CAMERA_SHIFT;
	
	
	with(obj_platforming_niko){		
		if(headfirst){
			camera_radius = radius + CAMERA_SHIFT;
			var camera_increment = 2*CAMERA_SHIFT/180;
			camera_radius -= camera_increment * (180-sprite_shift_time);
		}
		
	}
	

	var coordinates = convert_polar(angle, camera_radius);
	var camera_x = coordinates[0];
	var camera_y = coordinates[1];
	camera_x -= SCREEN_WIDTH/2;
	camera_y -= SCREEN_HEIGHT/2;
	var camera_angle = -angle-90;
	
	
	with(obj_platforming_niko){
		if(sprite_shift_time > 0){
			camera_angle += sprite_shift_time;
		}
	}
	
	
	camera_set_view_pos(
		view_camera[0],
		camera_x,
		camera_y
	);
	camera_set_view_angle(view_camera[0], camera_angle);
}



