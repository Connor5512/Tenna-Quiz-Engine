if phase == 0 {
	if pauses < 5 {
		if timer > 0 {
			timer -= 1;
			exit;
		} else {
			if color == c_blue {
				color = c_yellow;
			} else if color == c_yellow {
				color = c_blue;
			}
			pauses++;
			timer = 45;
		}
		draw_sprite_tiled_ext(spr_pixel, 0, 0, 0, room_width, room_height, color, 1);
	} else {
		phase = 1;
	}
}