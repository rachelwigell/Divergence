/// @function move()

with(obj_niko){
	
	
	// apply gravity
	var gravity_force = pos_radius/global.GRAVITY_FACTOR;
	vel_radius += is_falling * gravity_force;

	// apply velocity
	apply_velocity();

	// keep angle within 0-360 and radius within 0-WALL_RADIUS
	if(pos_radius < 0){
		pos_radius *= -1;
		pos_angle += 180;
		vel_radius *= -1;
		set_headfirst(true);
	}
	if(pos_angle >= 360){
		pos_angle -= 360;
	}
	else if(pos_angle < 0){
		pos_angle += 360;
	}
	
	with(obj_platforming_niko){
		// increment fall_stun_time as needed
		if(fall_stun_time >= 0){
			fall_stun_time--;
		}
		
		// shift sprite as needed
		if(sprite_shift_time > 0){
			var shift_increment = global.NIKO_HEIGHT/180;
			sprite_set_offset(spr_nikofront, global.NIKO_HEIGHT/2, shift_increment*sprite_shift_time);
			sprite_shift_time -= 1;
		}
	}
}