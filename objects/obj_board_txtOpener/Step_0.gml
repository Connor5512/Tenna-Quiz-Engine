if place_meeting(x, y, obj_board_player) && !(instance_exists(obj_txtb)) && !(activated) {
	var txt = instance_create_depth(0, 0, -9998, obj_txtb);
	txt.text = text;
	activated = true;
}