if in_view() && global.inventory[1].count == 1 && obj_board_player.can_move {
	global.inventory[1].count -= 1;
	instance_create_depth(x, y, 0, obj_board_lancer_dig);
}