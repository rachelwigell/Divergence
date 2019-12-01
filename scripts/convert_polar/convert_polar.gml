/// @function convert_polar(angle, radius, passed_axis, getting_up_time)
/// @param {real} angle
/// @param {real} radius
/// @param {boolean} headfirst
/// @param {real} getting_up_time

var angle = argument0;
var radius = argument1;
var headfirst = argument2;

//convert the sprite's polar coordinates to a cartesian x,y position
var sprite_x = room_width/2 + dcos(angle) * radius;
var sprite_y = room_height/2 - dsin(angle) * radius;
var coordinates = array_create(3);
coordinates[0] = sprite_x;
coordinates[1] = sprite_y;

// calculate the sprite's angle
var sprite_angle = angle + 90;
if(headfirst) { sprite_angle += 180; }
if(getting_up_time >= 0) { sprite_angle += 180; sprite_angle -= getting_up_time; }
coordinates[2] = sprite_angle;

return coordinates; 