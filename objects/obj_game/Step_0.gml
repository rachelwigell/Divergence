if(keyboard_check_pressed(ord("R"))) { game_restart(); }
if(keyboard_check_pressed(vk_escape)) { game_end(); }
if(keyboard_check_pressed(vk_lshift)) { global.fast_mode = not global.fast_mode; }
global.LADDER_SPEED = global.NIKO_HEIGHT/30 * (global.fast_mode + 1);
global.CIRCUMFERENCE_INCREMENT = global.NIKO_HEIGHT/1.5 * (global.fast_mode + 1);
global.JUMP_FACTOR = global.NIKO_HEIGHT/12 * (global.fast_mode + 1);
update_camera();