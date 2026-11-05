if place_meeting(x, y, obj_board_player) {
	image_index = 1;
	if !(instance_exists(global.lancer_pot1)) && !(instance_exists(global.lancer_pot2)) {
		reset_pots();
	}
} else {
	image_index = 0;
}