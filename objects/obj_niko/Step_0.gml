if(not global.freeze_movement){
	detect_collisions();
	register_inputs();
	move();
	event_inherited();
}