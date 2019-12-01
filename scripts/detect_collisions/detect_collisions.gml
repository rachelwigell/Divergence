/// @function detect_collisions()

var wall = noone;
with(obj_wall){
	wall = id;
}

with(obj_niko){	
	
	// check if on floor
	on_floor = pos_radius >= global.WALL_RADIUS; //or place_meeting(x, y, obj_collidable);
	
	if(on_floor and headfirst){
		getting_up_time = 0;
		headfirst = false;
	}
	
	//check for collisions with ladders
	on_ladder = false;
	for (var i=0; i<array_length_1d(wall.ladder_locations); i++) {
	   var ladder = wall.ladder_locations[i];
	   var ladder_angle = ladder[0];
	   var ladder_top = ladder[1];
	   var ladder_bottom = ladder[2];
	   if(pos_angle - global.LADDER_WIDTH/2 <= ladder_angle and
	      pos_angle + global.LADDER_WIDTH/2 >= ladder_angle and
		  pos_radius <= ladder_bottom and
		  pos_radius >= ladder_top){
			on_ladder = true;
	   }
	}

	//check for collisions with ledges
	on_ledge = false;
	for (var i=0; i<array_length_1d(wall.ledge_locations); i++) {
	   var ledge = wall.ledge_locations[i];
	   var ledge_radius = ledge[0];
	   var ledge_left = ledge[1];
	   var ledge_right = ledge[2];
	   if(pos_angle >= ledge_left and
	      pos_angle <= ledge_right and
		  pos_radius - global.LEDGE_TOLERANCE <= ledge_radius and
		  pos_radius + global.LEDGE_TOLERANCE >= ledge_radius){
			on_ledge = true;
			if(headfirst){
				getting_up_time = 0;
				headfirst = false;
			}
	   }
	}
	
	// determine if falling and stop vertical velocity if not
	is_falling = not on_floor and not on_ladder and not on_ledge;
	vel_radius *= is_falling;
}