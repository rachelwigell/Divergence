if keyboard_check(vk_left){
	pos_angle -= 1;
	// recalculate x & y based on new angle/radius
	x = room_width/2 + dcos(pos_angle) * pos_radius;
	y = room_height/2 - dsin(pos_angle) * pos_radius;
	image_angle = pos_angle + 90;
	camera_set_view_angle(view_camera[0], pos_angle+90);
	camera_set_view_pos(view_camera[0], x-150, y-150);
	
}

if keyboard_check(vk_right){
	pos_angle += 1;
	// recalculate x & y based on new angle/radius
	x = room_width/2 + dcos(pos_angle) * pos_radius;
	y = room_height/2 - dsin(pos_angle) * pos_radius;
	image_angle = pos_angle + 90;
	camera_set_view_angle(view_camera[0], pos_angle+90);
	camera_set_view_pos(view_camera[0], x-150, y-150);
}
