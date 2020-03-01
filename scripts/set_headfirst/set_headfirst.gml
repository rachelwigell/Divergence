/// @function calc_position_angle(headfirst)
/// @param {boolean} headfirst


var headfirst_val = argument0;

with(obj_platforming_niko){
	was_headfirst = headfirst;
	headfirst = headfirst_val;
	if(was_headfirst != headfirst) {
		if(headfirst){
			sprite_shift_time = 180;
		}
		else{
			fall_stun_time = pos_radius/global.FALL_STUN_FACTOR;
			sprite_shift_time = 0;
			sprite_set_offset(spr_nikofront, global.NIKO_HEIGHT/2, global.NIKO_HEIGHT);
		}
	}
}