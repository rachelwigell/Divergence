/// @function switch_full_screen(full_screen, new_width, new_height)
/// @param {real} full_screen
/// @param {real} new_width
/// @param {real} new_height

var full_screen = argument0;
var new_width = argument1;
var new_height = argument2;

with obj_game {
	if full_screen {
		game_width = display_get_width();
		game_height = display_get_height();
	
	}
	else{
		game_width = new_width;
		game_height = new_height;
	}

	window_set_fullscreen(full_screen);
	camera_set_view_size(view_camera[0], game_width, game_height);
	view_set_wport(0, game_width);
	view_set_hport(0, game_height);
	view_wport[0] = game_width;
	view_hport[0] = game_height;
	surface_resize(application_surface, game_width, game_height);
}