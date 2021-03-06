/// @function calc_position_angle()

with(obj_character){
	//convert the sprite's polar coordinates to a cartesian x,y position
	var coordinates = convert_polar(pos_angle, pos_radius);
	x = coordinates[0];
	y = coordinates[1];

	// calculate the sprite's angle
	image_angle = pos_angle + 90;
	with(obj_platforming_niko){
		if(headfirst) { image_angle += 180; }
	}
}