/// @function apply_velocity()

with(obj_niko){
	
	// where we will go if we don't hit anything first
	var dest_rad = pos_radius+vel_radius;
	var dest_angle = pos_angle+vel_angle;

	// hit the floor if it's in the way
	if(dest_rad > global.WALL_RADIUS) {
		dest_rad = global.WALL_RADIUS;
		on_floor = true;	
	}
	
	pos_radius = dest_rad;
	pos_angle = dest_angle;
}