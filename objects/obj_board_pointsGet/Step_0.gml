if place_meeting(x, y, obj_board_player) {
	var i = instance_create_depth(x, y, depth, obj_board_pointsAdd);
	i.image_index = clamp(points, 0, 9);
	instance_destroy();
}