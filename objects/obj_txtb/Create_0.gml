//textbox parameters
textbox_width = camera_get_view_width(view_camera[0]);
textbox_height = 80;
txtb_sprite = spr_txtb;

if instance_exists(obj_board_player) {
	obj_board_player.can_move = false;
}

if !variable_instance_exists(id, "txtb_delay_timer") {
	txtb_delay_timer = 0;
}

sound_played = false;

border = 12;
line_sep = 18;
line_width = textbox_width - border*2;
txtb_sprite = spr_txtb
txtb_image = 0;
txtb_image_spd = 0.125;
txtb_channel = -1;
txtb_snd = snd_board_text_main;

//the text
page = 0;
page_number = 0;
text[0] = "This is the test message.";

text_length[0] = string_length(text[0]);
draw_char = 0;
old_draw_char = 0;
text_speed = 0.5;

setup = false;

openerID = 0;

show_debug_message("Textbox created - " + string(id));