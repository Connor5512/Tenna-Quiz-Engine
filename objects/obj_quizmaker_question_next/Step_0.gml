image_speed = 0;

if cursor_hovering(id) && obj_quiz_new.current < array_length(obj_quiz_new.questions) - 1 {
	color = c_yellow;
} else {
	color = c_white;
}

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		if mouse_check_button_pressed(mb_left) {
			if obj_quiz_new.current < array_length(obj_quiz_new.questions) - 1 {
				obj_quiz_new.current++;
			}
		}
	}
}