/// @function is_on_ground(pos_radius, obj_depth)
/// @param {real} pos_radius
/// @param {real} obj_depth

WALL_RADIUS = 400;

radius = argument0;

if(radius < WALL_RADIUS){
	return false;
}

radius -= WALL_RADIUS;
obj_depth = argument1;

return radius >= obj_depth;