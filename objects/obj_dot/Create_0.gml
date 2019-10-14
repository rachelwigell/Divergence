pos_angle = 270;
pos_radius = 400;
obj_depth = 0;
on_ground = true;
coordinates = convert_polar(pos_angle, pos_radius, obj_depth);
x = coordinates[0];
y = coordinates[1];
image_angle = coordinates[2];
image_xscale = coordinates[3];
image_yscale = coordinates[3];
camera_set_view_pos(
	view_camera[0],
	coordinates[4],
	coordinates[5]
);
camera_set_view_angle(view_camera[0], coordinates[6]);