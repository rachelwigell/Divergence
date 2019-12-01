if(keyboard_check_pressed(ord("R"))) { game_restart(); }
if(keyboard_check_pressed(vk_escape)) { game_end(); }
if(keyboard_check_pressed(vk_lshift)) { global.fast_mode = not global.fast_mode; }
global.RADIUS_INCREMENT = global.WALL_RADIUS/800 * (global.fast_mode + 1);
