/// @function calc_position_angle(headfirst)
/// @param {boolean} headfirst

if(global.platforming_scene){
	var headfirst_val = argument0;

	with(obj_niko){
		headfirst = headfirst_val;
		if(headfirst){
			sprite_shift_time = global.NIKO_HEIGHT;
		}
		else{
			fall_stun_time = pos_radius/global.FALL_STUN_FACTOR;
			getting_up_time = 0;
			sprite_shift_time = 0;
			sprite_set_offset(spr_nikofront, 64, global.NIKO_HEIGHT);
		}
	}
}