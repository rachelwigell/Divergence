/// @function calc_position_angle(headfirst)
/// @param {boolean} headfirst

var headfirst_val = argument0;

with(obj_niko){
	headfirst = headfirst_val;
	if(not headfirst){
		fall_stun_time = pos_radius/global.FALL_STUN_FACTOR;
		getting_up_time = 0;
	}
}