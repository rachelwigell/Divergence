/// @function convert_polar(angle, radius)
/// @param {real} angle
/// @param {real} radius

//convert the sprite's polar coordinates to a cartesian x,y position
sprite_x = room_width/2 + dcos(argument0) * argument1;
sprite_y = room_height/2 - dsin(argument0) * argument1;
coordinates = array_create(6);
coordinates[0] = sprite_x;
coordinates[1] = sprite_y;

// calculate the image angle
sprite_angle = argument0 + 90;
coordinates[2] = sprite_angle;

// calculate the camera settings
camera_x = sprite_x-camera_get_view_width(view_camera[0])/2;
camera_y = sprite_y-camera_get_view_height(view_camera[0])/2;
camera_angle = -argument0-90;
coordinates[3] = camera_x;
coordinates[4] = camera_y;
coordinates[5] = camera_angle;
return coordinates;