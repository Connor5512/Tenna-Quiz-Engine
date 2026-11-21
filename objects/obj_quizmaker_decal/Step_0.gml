decal = obj_quiz_new.questions[obj_quiz_new.current].decal;

x = decal_x;
y = decal_y;

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		color = c_yellow;
	} else {
		color = c_white;
	}
	if clicked_by_cursor(id) {
		state = quiz_creator_button_states.clicked;
		color = c_yellow;
	}
} else if state == quiz_creator_button_states.clicked {
	var upload = get_open_filename("Image files (*.png)|*.png", "");
	
	if upload == "" {
		debug_message(object_index, id, "File import canceled by user.", log_types.info);
	
	state = quiz_creator_button_states.normal;
	color = c_white;
		exit;
	}
	
	uploaded_sprite = sprite_add(upload, 1, false, false, 0, 0);
	sprite_set_offset(uploaded_sprite, sprite_get_width(uploaded_sprite)/2, sprite_get_height(uploaded_sprite)/2)
	
	obj_quiz_new.questions[obj_quiz_new.current].decal = uploaded_sprite;
	
	state = quiz_creator_button_states.normal;
	color = c_white;
}