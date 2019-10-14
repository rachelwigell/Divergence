/// @function convert_polar(angle, radius)
/// @param {real} angle
/// @param {real} radius
/// @param {real} obj_depth

WALL_RADIUS = 400;
angle = argument0;
radius = argument1;
obj_depth = argument2;

//convert the sprite's polar coordinates to a cartesian x,y position
sprite_x = room_width/2 + dcos(angle) * radius;
sprite_y = room_height/2 - dsin(angle) * radius;
coordinates = array_create(7);
coordinates[0] = sprite_x;
coordinates[1] = sprite_y;

// calculate the sprite's angle
sprite_angle = angle + 90;
coordinates[2] = sprite_angle;

// calculate the sprite's scale
sprite_scale = 1 + obj_depth/30;
coordinates[3] = sprite_scale;

// calculate the camera settings
camera_radius = min(radius - 75, WALL_RADIUS - 75);
camera_x = room_width/2 + dcos(angle) * camera_radius;
camera_x -= camera_get_view_width(view_camera[0])/2;
camera_y = room_height/2 - dsin(angle) * camera_radius;
camera_y -= camera_get_view_height(view_camera[0])/2;
camera_angle = -angle-90;
coordinates[4] = camera_x;
coordinates[5] = camera_y;
coordinates[6] = camera_angle;

return coordinates; 