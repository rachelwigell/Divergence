WALL_RADIUS = 400;
MAX_RADIUS = 500;

if(on_ground){
	vel_radius = 0;
	vel_angle = 0;
}

// register inputs
if(on_ground){
	if keyboard_check(vk_left){
		vel_angle -= 1;
	}

	if keyboard_check(vk_right){
		vel_angle += 1;
	}

	if keyboard_check(vk_up){
		if(on_ground){
			pos_radius -= 1;
			obj_depth = max(0, obj_depth-1);
		}
	}

	if keyboard_check(vk_down){
		if(pos_radius < MAX_RADIUS){
			pos_radius += 1;
			if(pos_radius > WALL_RADIUS){
				obj_depth += 1;
			}
		}
		
	}

	if keyboard_check_pressed(vk_space){
		vel_radius -= 5;
	}
}


// apply gravity
gravity_force = pos_radius/1000;
if(not on_ground){
	vel_radius += gravity_force;
}

// apply velocity
pos_radius += vel_radius;
pos_angle += vel_angle;

// update sprite position, angle; camera settings
coordinates = convert_polar(pos_angle, pos_radius, obj_depth);
x = coordinates[0];
y = coordinates[1];
image_angle = coordinates[2];
image_xscale = coordinates[3];
image_yscale = coordinates[3];
camera_set_view_pos(
	view_camera[0],
	coordinates[4],
	coordinates[5]
);
camera_set_view_angle(view_camera[0], coordinates[6]);
on_ground = is_on_ground(pos_radius, obj_depth);