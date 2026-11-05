if abs(x - obj_board_player.x) <= 18 && abs(y - obj_board_player.y) <= 18 {
	image_index = 1;
} else {
	image_index = 0;
}

if target_x == x && target_y == y {
	var detect_dist = 18;
	var px = obj_board_player.x + lengthdir_x(detect_dist, obj_board_player.direction);
	var py = obj_board_player.y + lengthdir_y(detect_dist, obj_board_player.direction);
	var facing_box = instance_position(px, py, obj_board_pushcactus);
	if (facing_box == id) && keyboard_check_pressed(ord("Z")) && !(pushed) {
		audio_play_sound(snd_board_blockpush, 10, false);
		instance_create_layer(x, y, "Pickup", obj_board_key);
		pushed = true;
		if obj_board_player.direction == 0 {
			target_x = x + 32;
			target_y = y;
		} else if obj_board_player.direction == 90 {
			target_x = x;
			target_y = y - 32;
		} else if obj_board_player.direction == 180 {
			target_x = x - 32;
			target_y = y;
		} else if obj_board_player.direction == 270 {
			target_x = x;
			target_y = y + 32;
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