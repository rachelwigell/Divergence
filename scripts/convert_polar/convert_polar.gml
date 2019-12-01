/// @function convert_polar()

with(obj_niko){
	//convert the sprite's polar coordinates to a cartesian x,y position
	x = room_width/2 + dcos(pos_angle) * pos_radius;
	y = room_height/2 - dsin(pos_angle) * pos_radius;

	// calculate the sprite's angle
	image_angle = pos_angle + 90;
	if(headfirst) { image_angle += 180; }
	if(getting_up_time >= 0) { image_angle += 180; image_angle -= getting_up_time; }
}