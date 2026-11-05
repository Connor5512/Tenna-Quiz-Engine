if target_x == x && target_y == y {
	var detect_dist = 18;
	var px = obj_board_player.x + lengthdir_x(detect_dist, obj_board_player.direction);
	var py = obj_board_player.y + lengthdir_y(detect_dist, obj_board_player.direction);
	var facing_box = instance_position(px, py, obj_board_pushbox);
	if (facing_box == id) && keyboard_check_pressed(ord("Z")) {
		audio_play_sound(snd_board_blockpush, 10, false);
		if obj_board_player.direction == 0 {
			if can_push_to(x + 32, y) {
				target_x = x + 32;
				target_y = y;
			}
		} else if obj_board_player.direction == 90 {
			if can_push_to(x, y - 32) {
				target_x = x;
				target_y = y - 32;
			}
		} else if obj_board_player.direction == 180 {
			if can_push_to(x - 32, y) {
				target_x = x - 32;
				target_y = y;
			}
		} else if obj_board_player.direction == 270 {
			if can_push_to(x, y + 32) {
				target_x = x;
				target_y = y + 32;
			}
		}
	}
} else {
	if x > target_x {
		x -= 2;
	} else if x < target_x {
		x += 2;
	}
	if y > target_y {
		y -= 2;
	} else if y < target_y {
		y += 2;
	}
	
	if abs(x - target_x) < 2 {
		x = target_x;
	}
	if abs(y - target_y) < 2 {
		y = target_y;
	}
}