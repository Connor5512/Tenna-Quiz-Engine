if global.quiz_phase == quiz_phases.answer {
	if obj_selectionicon.character == skin {
		if timer == 0 {
			sprite_index = sprites[skin].press;
			image_index = 0;
			if keyboard_check_pressed(vk_down) {
				sprite_index = sprites[skin].press;
				image_index = 1;
				timer = new_timer;
			} else if keyboard_check_pressed(vk_up) {
				sprite_index = sprites[skin].press;
				image_index = 1;
				timer = new_timer;
			} else if keyboard_check_pressed(ord("Z")) {
				sprite_index = sprites[skin].press;
				image_index = 1;
				timer = new_timer;
			}
		} else {
			timer--;
		}
	} else {
		sprite_index = sprites[skin].idle;
	}
} else {
	sprite_index = sprites[skin].normal;
}