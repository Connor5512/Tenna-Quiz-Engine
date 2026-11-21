image_speed = 0;

if cursor_hovering(id) {
	color = c_yellow;
} else {
	color = c_white;
}

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		if mouse_check_button_pressed(mb_left) {
			array_push(obj_quiz_new.questions, 
			{
				option1 : "Option 1",
				option2 : "Option 2",
				option3 : "Option 3",
				option4 : "Option 4",
		
				correct : 0,
		
				text : "Question text.",
		
				decal : spr_blank,
				decal_scale : 1
			}
	)
		}
	}
}