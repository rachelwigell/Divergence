//check for collisions with ladders
for (var i=0; i<array_length_1d(other.ladder_locations); i++) {
   var ladder = other.ladder_locations[i];
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
for (var i=0; i<array_length_1d(other.ledge_locations); i++) {
   var ledge = other.ledge_locations[i];
   var ledge_radius = ledge[0];
   var ledge_left = ledge[1];
   var ledge_right = ledge[2];
   if(pos_angle >= ledge_left and
      pos_angle <= ledge_right and
	  pos_radius - global.LEDGE_TOLERANCE <= ledge_radius and
	  pos_radius + global.LEDGE_TOLERANCE >= ledge_radius){
		on_ledge = true;
   }
}