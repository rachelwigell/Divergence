var RADIUS_INCREMENT = global.WALL_RADIUS/800;
var ANGLE_INCREMENT = 500/global.WALL_RADIUS;
var GRAVITY_FACTOR = global.WALL_RADIUS * 4;

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
		if(on_floor){
			pos_radius -= RADIUS_INCREMENT;
			obj_depth = max(0, obj_depth-RADIUS_INCREMENT);
		}
		else if(on_ladder){
			pos_radius -= RADIUS_INCREMENT*2;
		}
	}

	if keyboard_check(vk_down){
		if(pos_radius < global.MAX_RADIUS){
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
var gravity_force = pos_radius/GRAVITY_FACTOR;
if(not on_floor and not on_ladder and not on_ledge){
	vel_radius += gravity_force;
}

// apply velocity
pos_radius = min(pos_radius+vel_radius, obj_depth+global.WALL_RADIUS);
pos_angle += vel_angle;

// update sprite position, angle; camera settings
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