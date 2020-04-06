if(current_dialogue != noone){
	display_dialogue(name, current_dialogue, dialogue_step);
	var current_dialogue_length = string_length(current_dialogue[0]);
	dialogue_step = min(current_dialogue_length, dialogue_step+1);
	global.freeze_movement = true;
	if(dialogue_step >= current_dialogue_length and keyboard_check_pressed(vk_space)) {
		current_dialogue = noone;
		dialogue_step = 0;
		global.freeze_movement = false;
	}
	else if (keyboard_check_pressed(vk_space) and dialogue_step > 1) {
		dialogue_step = current_dialogue_length;
	}
}