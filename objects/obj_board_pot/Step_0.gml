if !(thrown) {
	if  (obj_board_player.can_move) && !(instance_exists(obj_txtb)) {
		if (global.power_croissant) && keyboard_check_pressed(ord("Z")) && (global.holding_pot == noone) {
			var detect_dist = 18;
			var px = obj_board_player.x + lengthdir_x(detect_dist, obj_board_player.direction);
			var py = obj_board_player.y + lengthdir_y(detect_dist, obj_board_player.direction);
			var facing_box = instance_position(px, py, obj_board_pot);
			if (facing_box == id) {
				global.holding_pot = id;
				exit;
			}
		}

		if (global.holding_pot == id) {
			x = obj_board_player.x - 16;
			y = obj_board_player.y - 32;
			depth = obj_board_player.depth - 1;
			if keyboard_check_pressed(ord("Z")) && can_throw {
				thrown = true
				audio_play_sound(snd_board_throw, 10, false);
				global.holding_pot = noone;
				g = 7;
				if throw_y < y {
					y = throw_y - 32;
				}
			}
		}
	}
} else {
	g -= 0.5;
	y -= g;
	if x < throw_x {
		x += 2;
	} else if x > throw_x {
		x -= 2;
	}
	
	if y >= throw_y {
		instance_destroy();
	}
}