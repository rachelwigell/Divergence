/// @function apply_velocity()

var wall = noone;
with(obj_wall){
	wall = id;
}

with(obj_niko){
	
	// where we will go if we don't hit anything first
	var dest_radius = pos_radius+vel_radius;
	var dest_angle = pos_angle+vel_angle;

	// hit the floor if it's in the way
	if(dest_radius > global.WALL_RADIUS) {
		dest_radius = global.WALL_RADIUS;
		on_floor = true;	
	}
	
	with(obj_platforming_niko){
		// hit a ledge if it's in the way
		if(dest_radius != pos_radius){ // avoid division by zero
			for (var i=0; i<array_length_1d(wall.ledge_locations); i++) {
				var ledge = wall.ledge_locations[i];
				var ledge_radius = ledge[0];
				var ledge_left = ledge[1];
				var ledge_right = ledge[2];  
				var ledge_intersect_angle = ((ledge_radius*dest_angle) - (ledge_radius*pos_angle) - (pos_radius*dest_angle) + (dest_radius*pos_angle)) / (dest_radius-pos_radius);
				if(value_between(ledge_radius, pos_radius, dest_radius)){  
					if(value_between(ledge_intersect_angle, ledge_left, ledge_right)){
						dest_radius = ledge_radius;
						dest_angle = ledge_intersect_angle;
						on_ledge = true;
						set_headfirst(false);
						break;
					}
				}
			}
		}
	}
	
	pos_radius = dest_radius;
	pos_angle = dest_angle;
}