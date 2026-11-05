if !(solved) && (within_camera_view() && obj_board_player.y > obj_board_cameraguide.camera_u + 30 && obj_board_player.x > obj_board_cameraguide.camera_l + 42) {
	if puzzle_id == 1 {
		instance_activate_layer("Puzzle1Walls");
		layer_set_visible("Puzzle1Walls", true);
	} else if puzzle_id == 2 {
		instance_activate_layer("Puzzle2Walls");
		layer_set_visible("Puzzle2Walls", true);
	} else if puzzle_id == 3 {
		instance_activate_layer("Puzzle3Walls");
		layer_set_visible("Puzzle3Walls", true);
	}
	
	if place_meeting(x, y, obj_board_pushbox) || (place_meeting(x, y, obj_board_player) && array_contains(block_sprites, obj_board_player.sprite_index)) {
		solved = true;
	}
} else {
	if puzzle_id == 1 {
		instance_deactivate_layer("Puzzle1Walls");
		layer_set_visible("Puzzle1Walls", false);
	} else if puzzle_id == 2 {
		instance_deactivate_layer("Puzzle2Walls");
		layer_set_visible("Puzzle2Walls", false);
	} else if puzzle_id == 3 {
		instance_deactivate_layer("Puzzle3Walls");
		layer_set_visible("Puzzle3Walls", false);
	}
}