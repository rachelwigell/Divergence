if(keyboard_check_pressed(ord("R"))) { game_restart(); }
if(keyboard_check_pressed(vk_escape)) { game_end(); }
if(keyboard_check_pressed(vk_lshift)) { global.fast_mode = not global.fast_mode; }
global.LADDER_SPEED = global.NIKO_HEIGHT/30 * (global.fast_mode + 1);
global.CIRCUMFERENCE_INCREMENT = global.NIKO_HEIGHT*2 * (global.fast_mode + 1);
global.JUMP_FACTOR = global.NIKO_HEIGHT/80 * (global.fast_mode + 1);

if(keyboard_check_pressed(ord("1"))){ switch_full_screen(true, noone, noone); }
if(keyboard_check_pressed(ord("2"))){ switch_full_screen(false, 1400, 700); }
if(keyboard_check_pressed(ord("3"))){ switch_full_screen(false, 800, 800); }

// @TODO: only execute this line of code when in "settings" screen
window_set_size(game_width, game_height);

update_camera();