question = obj_quiz_new.questions[obj_quiz_new.current].text;

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		color = c_yellow;
	} else {
		color = c_white;
	}
	if clicked_by_cursor(id) {
		state = quiz_creator_button_states.clicked;
		color = c_yellow;
		keyboard_string = question;
	}
} else if state == quiz_creator_button_states.clicked {
	question = keyboard_string;
	
	if !(cursor_hovering(id)) && (mouse_check_button_pressed(mb_left)) {
		state = quiz_creator_button_states.normal;
		color = c_white;
	}
	
	if keyboard_check_pressed(vk_enter) {
		state = quiz_creator_button_states.normal;
		color = c_white;
		
		if question == "" {
			question = "Question text";
		}
		
		obj_quiz_new.questions[obj_quiz_new.current].text = question;
		debug_message(object_index, id, "Question " + string(obj_quiz_new.current) + " text changed: " + obj_quiz_new.questions[obj_quiz_new.current].text);
	}
}