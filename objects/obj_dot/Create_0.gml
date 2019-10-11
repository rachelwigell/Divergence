pos_angle = 270;
pos_radius = 400;
coordinates = convert_polar(pos_angle, pos_radius);
x = coordinates[0];
y = coordinates[1];
image_angle = coordinates[2];
camera_set_view_pos(
	view_camera[0],
	coordinates[3],
	coordinates[4]
);
camera_set_view_angle(view_camera[0], coordinates[5]);