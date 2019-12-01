/// @function convert_polar(angle, radius)
/// @param {real} angle
/// @param {real} radius

var angle = argument0;
var radius = argument1;

var coordinates = array_create(2);

var x_coor = room_width/2 + dcos(angle) * radius;
var y_coor = room_height/2 - dsin(angle) * radius;

coordinates[0] = x_coor;
coordinates[1] = y_coor;

return coordinates;