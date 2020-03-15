var dialogue = argument0;
var speaking_character = argument1;
var portrait = argument2;

var TEXTBOX_BUFFER = 20;
var SCREEN_WIDTH = camera_get_view_width(view_camera[0]);
var SCREEN_HEIGHT = camera_get_view_height(view_camera[0])
var TEXTBOX_WIDTH = sprite_get_width(spr_textbox);
var TEXTBOX_HEIGHT = sprite_get_height(spr_textbox);
var PORTRAIT_WIDTH = sprite_get_width(portrait);
var PORTRAIT_HEIGHT = sprite_get_height(portrait);
		
display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT);
// draw textbox
draw_sprite(spr_textbox, 0, SCREEN_WIDTH/2, TEXTBOX_BUFFER);
// draw portrait
draw_sprite(portrait, 0, SCREEN_WIDTH/2 - TEXTBOX_WIDTH/2 + TEXTBOX_BUFFER, TEXTBOX_BUFFER);
// write character name under portrait
draw_set_halign(fa_center);
draw_set_font(fnt_portrait_name_font);
draw_text(SCREEN_WIDTH/2 - TEXTBOX_WIDTH/2 + TEXTBOX_BUFFER + PORTRAIT_WIDTH/2, TEXTBOX_HEIGHT-TEXTBOX_BUFFER, speaking_character)
// write dialogue
draw_set_halign(fa_left);
draw_set_font(fnt_textbox_text);
draw_text_ext(SCREEN_WIDTH/2 - TEXTBOX_WIDTH/2 + PORTRAIT_WIDTH + 2*TEXTBOX_BUFFER,
	TEXTBOX_BUFFER*2,
	dialogue, TEXTBOX_BUFFER,
	TEXTBOX_WIDTH-2*TEXTBOX_BUFFER-PORTRAIT_WIDTH);