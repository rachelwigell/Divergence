MAX_RADIUS = global.WALL_RADIUS + global.WALL_RADIUS/6;
RADIUS_INCREMENT = global.WALL_RADIUS/800;
ANGLE_INCREMENT = 500/global.WALL_RADIUS;
GRAVITY_FACTOR = global.WALL_RADIUS * 2.5;

if(on_floor or on_ledge or on_ladder){
	vel_radius = 0;
	vel_angle = 0;
}

// register inputs
if(on_floor or on_ledge or on_ladder){
	if keyboard_check(vk_left){
		vel_angle -= ANGLE_INCREMENT;
	}

	if keyboard_check(vk_right){
		vel_angle += ANGLE_INCREMENT;
	}

	if keyboard_check(vk_up){
		if(on_floor or on_ladder){
			pos_radius -= RADIUS_INCREMENT;
		}
		if(on_floor){
			obj_depth = max(0, obj_depth-RADIUS_INCREMENT);
		}
	}

	if keyboard_check(vk_down){
		if(pos_radius < MAX_RADIUS){
			if(on_floor or on_ladder){
				pos_radius += RADIUS_INCREMENT;
			}
			if(on_floor and pos_radius > global.WALL_RADIUS){
				obj_depth += RADIUS_INCREMENT;
			}
		}
		
	}

	if keyboard_check_pressed(vk_space){
		vel_radius -= RADIUS_INCREMENT*5;
	}
}


// apply gravity
gravity_force = pos_radius/GRAVITY_FACTOR;
if(not on_floor and not on_ladder and not on_ledge){
	show_debug_message("falling");
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
on_floor = is_on_floor(pos_radius, obj_depth);
on_ladder = false;
on_ledge = false;