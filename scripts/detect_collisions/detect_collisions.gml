/// @function detect_collisions()

var wall = noone;
with(obj_wall){
	wall = id;
}

with(obj_niko){	
	
	// check if on floor
	on_floor = pos_radius >= global.WALL_RADIUS; 
	
	if(global.platforming_scene){
		if(on_floor){
			on_ladder = false;
		}
	
		if(on_floor and headfirst){
			set_headfirst(false);
		}
	
		//check for collisions with ladders
		var touching_ladder = false;
		touched_ladder_angle = -1;
		for (var i=0; i<array_length_1d(wall.ladder_locations); i++) {
		   var ladder = wall.ladder_locations[i];
		   var ladder_angle = ladder[0];
		   var ladder_top = ladder[1];
		   var ladder_bottom = ladder[2];
		   if(pos_angle - global.LADDER_WIDTH/2 <= ladder_angle and
		      pos_angle + global.LADDER_WIDTH/2 >= ladder_angle and
			  pos_radius <= ladder_bottom and
			  pos_radius >= ladder_top){
				touching_ladder = true;
				touched_ladder_angle = ladder_angle;
		   }
		}
		if(not touching_ladder) { on_ladder = false; }

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
					pos_radius = pos_radius;
					set_headfirst(false);
				}
		   }
		}
	}
}