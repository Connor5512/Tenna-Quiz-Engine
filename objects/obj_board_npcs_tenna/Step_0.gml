if !(instance_exists(obj_txtb)) {
	var detect_dist = 18;
	var px = obj_board_player.x + lengthdir_x(detect_dist, obj_board_player.direction);
	var py = obj_board_player.y + lengthdir_y(detect_dist, obj_board_player.direction);
	var facing_box = instance_position(px, py, obj_board_npcs_tenna);
	if (facing_box == id) && keyboard_check_pressed(ord("Z")) {
		var txt = instance_create_depth(0, 0, -9998, obj_txtb);
		txt.text = text;
	}
}