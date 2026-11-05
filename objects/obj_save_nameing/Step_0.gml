//CONTROLS --
//wrapping for up and down
if keyboard_check_pressed(vk_up) {
	if (image_index != 26 && image_index != 27) {
		if image_index >= 10 {
			image_index -= 10;
		} else {
			if (image_index == 6 || image_index == 7) {
				image_index = 26;
			} else if (image_index == 8 || image_index == 9) {
				image_index = 27;
			} else {
				image_index -= 8;
			}
		}
	} else {
		if image_index == 26 {
			image_index -= 10;
		} else {
			image_index -= 9;
		}
	}
}

if keyboard_check_pressed(vk_down) {
	if (image_index != 26 && image_index != 27) {
		if image_index <= 19 {
			if image_index >= 16 {
				if image_index <= 17 { //16 or 17
					image_index = 26;
				} else {
					image_index = 27;
				}
			} else {
				image_index += 10;
			}
		} else {
			image_index += 8;
		}
	} else {
		if image_index = 26 {
			image_index = 6;
		} else {
			image_index = 8;
		}
	}
}

//wrapping for left&right
if keyboard_check_pressed(vk_right) {
	if (image_index == 9 || image_index == 19) {
		image_index -= 9;
	} else if image_index == 27 {
		image_index -= 7
	} else {
		image_index += 1;
	}
}

if keyboard_check_pressed(vk_left) {
	if (image_index == 0 || image_index == 10) {
		image_index += 9;
	} else if image_index == 20 {
		image_index += 7
	} else {
		image_index -= 1;
	}
}

//NAME STRING --
if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
	add_letter_from_index(image_index);
}
if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift)) {
	add_letter_from_index(26);
}