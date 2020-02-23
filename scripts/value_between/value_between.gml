/// @function value_between(is_between, value1, value2)
/// @param {real} is_between
/// @param {real} value1
/// @param {real} value2

var is_between = argument0; // the value we're checking for betweenness
var value1 = argument1;
var value2 = argument2; // the values making up the two ends of the interval
var inclusive = argument3;

if inclusive {
	if(value1 <= is_between and is_between <= value2){ return true; }
	if (value2 <= is_between and is_between <= value1) { return true; }
	return false;
}
else{
	if(value1 < is_between and is_between < value2){ return true; }
	if (value2 < is_between and is_between < value1) { return true; }
	return false;
}