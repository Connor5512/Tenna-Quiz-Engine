if cursor_hovering(id) {
	color = c_yellow;
} else {
	color = c_white;
}

if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		if mouse_check_button(mb_left) {
			var spr = obj_quiz_new.questions[obj_quiz_new.current].decal;
			var xoff = sprite_get_xoffset(spr);
			var yoff = sprite_get_yoffset(spr);
			if mouse_x < x+(8*image_xscale) {
				sprite_set_offset(spr, xoff+1, yoff);
			} else if mouse_x > x+(39*image_xscale) {
				sprite_set_offset(spr, xoff-1, yoff);
			}
		}
	}
}