if !(instance_exists(obj_save_nameing)) {
	if selected_player == 0 {
		selected_player = 1;
		var n = instance_create_depth(97, 185, -9999, obj_save_nameing);
		n.prompt = "PLAYER 1'S NAME?";
	} else if selected_player == 1 {
		selected_player = 2;
		var n = instance_create_depth(97, 185, -9999, obj_save_nameing);
		n.prompt = "PLAYER 2'S NAME?";
	} else if selected_player == 2 {
		selected_player = 3;
		var n = instance_create_depth(97, 185, -9999, obj_save_nameing);
		n.prompt = "PLAYER 3'S NAME?";
	} else if selected_player ==  3 {
		room_goto(room_title);
	}
}