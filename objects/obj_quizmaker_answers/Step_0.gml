text = variable_struct_get(obj_quiz_new.questions[obj_quiz_new.current], "option" + string(option + 1));
draw_set_font(fnt_8bit);
draw_set_halign(fa_left);


if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		color = c_yellow;
	} else {
		color = c_white;
	}
	if clicked_by_cursor(id) {
		state = quiz_creator_button_states.clicked;
		color = c_yellow;
		keyboard_string = text;
	}
} else if state == quiz_creator_button_states.clicked {
	text = keyboard_string;
	
	if !(cursor_hovering(id)) && (mouse_check_button_pressed(mb_left)) {
		state = quiz_creator_button_states.normal;
		color = c_white;
	}
	
	if keyboard_check_pressed(vk_enter) {
		state = quiz_creator_button_states.normal;
		color = c_white;
		
		if text == "" {
			text = "Option " + string(option + 1);
		}
		
		variable_struct_set(obj_quiz_new.questions[obj_quiz_new.current], "option" + string(option + 1), text);
	}
}

var limit = 146;
if string_width(text) >= 146 {
	text_scale = ((limit-2)/string_width(text));
	image_xscale = text_scale*string_width(text);
} else {
	text_scale = 1;
	image_xscale = string_width(text);
}
image_yscale = string_height(text);