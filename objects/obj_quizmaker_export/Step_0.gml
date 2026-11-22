image_speed = 0;

if cursor_hovering(id) {
	color = c_yellow;
} else {
	color = c_white;
}

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		if mouse_check_button_pressed(mb_left) {
			var inst = instance_create_depth(0, 0, 0, obj_quiz_handler);
			inst.mode = quiz_modes.export_creator;
		}
	}
}