if option == quiz_details._title {
	text = obj_quiz_new.bank_name;
} else {
	text = obj_quiz_new.__author;
}

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		color = c_yellow;
	} else {
		color = c_black;
	}
	if clicked_by_cursor(id) {
		state = quiz_creator_button_states.clicked;
		color = c_yellow;
		keyboard_string = text;
	}
} else if state == quiz_creator_button_states.clicked {
	if option == quiz_details._title {
		keyboard_string = string_replace_all(keyboard_string, "<", "");
		keyboard_string = string_replace_all(keyboard_string, ">", "");
		keyboard_string = string_replace_all(keyboard_string, ":", "");
		keyboard_string = string_replace_all(keyboard_string, "\"", "");
		keyboard_string = string_replace_all(keyboard_string, "/", "");
		keyboard_string = string_replace_all(keyboard_string, "\\", "");
		keyboard_string = string_replace_all(keyboard_string, "|", "");
		keyboard_string = string_replace_all(keyboard_string, "?", "");
		keyboard_string = string_replace_all(keyboard_string, "<*", "");
	}
	
	text = keyboard_string;
	
	if !(cursor_hovering(id)) && (mouse_check_button_pressed(mb_left)) {
		state = quiz_creator_button_states.normal;
		color = c_black;
	}
	
	if keyboard_check_pressed(vk_enter) {
		state = quiz_creator_button_states.normal;
		color = c_black;
		
		if text == "" {
			if option == quiz_details._title {
				text = "Untitled Quiz";
			} else {
				text = "Nobody";
			}
		}
		
		if option == quiz_details._title {
			obj_quiz_new.bank_name = text;
		} else {
			obj_quiz_new.__author = text;
		}
	}
}

image_xscale = string_width(text);
image_yscale = string_height(text);