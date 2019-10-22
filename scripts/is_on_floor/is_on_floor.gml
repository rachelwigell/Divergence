/// @function is_on_floor(pos_radius, obj_depth)
/// @param {real} pos_radius
/// @param {real} obj_depth

radius = argument0;

if(radius < global.WALL_RADIUS){
	return false;
}

radius -= global.WALL_RADIUS;
obj_depth = argument1;

return radius >= obj_depth;