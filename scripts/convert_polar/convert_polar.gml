/// @function convert_polar(angle, radius)
/// @param {real} angle
/// @param {real} radius

WALL_RADIUS = 400;

//convert the sprite's polar coordinates to a cartesian x,y position
sprite_x = room_width/2 + dcos(argument0) * argument1;
sprite_y = room_height/2 - dsin(argument0) * argument1;
coordinates = array_create(7);
coordinates[0] = sprite_x;
coordinates[1] = sprite_y;

// calculate the sprite's angle
sprite_angle = argument0 + 90;
coordinates[2] = sprite_angle;
sprite_scale = 1;
if(argument1 > WALL_RADIUS){
	sprite_scale = 1 + (argument1-WALL_RADIUS)/50;
}
coordinates[3] = sprite_scale;

// calculate the camera settings
camera_radius = argument1 - 75;
camera_x = room_width/2 + dcos(argument0) * camera_radius;
camera_x -= camera_get_view_width(view_camera[0])/2;
camera_y = room_height/2 - dsin(argument0) * camera_radius;
camera_y -= camera_get_view_height(view_camera[0])/2;
camera_angle = -argument0-90;
coordinates[4] = camera_x;
coordinates[5] = camera_y;
coordinates[6] = camera_angle;
return coordinates;