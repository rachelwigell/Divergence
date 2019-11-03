/// @function convert_polar(angle, radius, obj_depth)
/// @param {real} angle
/// @param {real} radius
/// @param {real} obj_depth

var SCALE_FACTOR = 300;
var angle = argument0;
var radius = argument1;
var obj_depth = argument2;

//convert the sprite's polar coordinates to a cartesian x,y position
var sprite_x = room_width/2 + dcos(angle) * radius;
var sprite_y = room_height/2 - dsin(angle) * radius;
var coordinates = array_create(4);
coordinates[0] = sprite_x;
coordinates[1] = sprite_y;

// calculate the sprite's angle
var sprite_angle = angle + 90;
coordinates[2] = sprite_angle;

// calculate the sprite's scale
var sprite_scale = 1 + obj_depth/SCALE_FACTOR;
coordinates[3] = sprite_scale;

return coordinates; 