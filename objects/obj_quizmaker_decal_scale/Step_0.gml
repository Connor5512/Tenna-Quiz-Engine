drawn_scale = obj_quiz_new.questions[obj_quiz_new.current].decal_scale;

if cursor_hovering(id) {
	color = c_yellow;
} else {
	color = c_white;
}

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		if mouse_check_button_pressed(mb_left) {
			if (mouse_x > x+(8*image_xscale)) && (mouse_x < x+(39*image_xscale)) {
				state = quiz_creator_button_states.clicked;
				color = c_yellow;
				keyboard_string = obj_quiz_new.questions[obj_quiz_new.current].decal_scale;
			}
		}
		
		if mouse_check_button(mb_left) {
			if mouse_x < x+(8*image_xscale) {
				obj_quiz_new.questions[obj_quiz_new.current].decal_scale -= 0.01;
			} else if mouse_x > x+(39*image_xscale) {
				obj_quiz_new.questions[obj_quiz_new.current].decal_scale += 0.01;
			}
		}
	}
} else if state == quiz_creator_button_states.clicked {
	if !(cursor_hovering(id)) && (mouse_check_button_pressed(mb_left)) {
		state = quiz_creator_button_states.normal;
		color = c_white;
	}
	color = c_yellow;
	keyboard_string = string_numbers(keyboard_string);
	if keyboard_string == "" {
		keyboard_string = "0";
	}
	
	drawn_scale = real(keyboard_string)/100;
	
	if keyboard_check_pressed(vk_enter) {
		var scale = real(keyboard_string)/100;
		obj_quiz_new.questions[obj_quiz_new.current].decal_scale = scale;
		state = quiz_creator_button_states.normal;
		color = c_white;
	}
}