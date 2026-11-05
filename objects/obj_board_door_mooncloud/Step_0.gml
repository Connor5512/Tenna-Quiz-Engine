if timer > 0 {
	timer -= 1;
	exit;
}

if pauses == 1 {
	global.just_warped = false;
	pauses = 2;
}

if door_mooncloud_get_open() {
	image_index = 2;
	if place_meeting(x, y, obj_board_player) {
		obj_board_player.x = warp_x;
		obj_board_player.y = warp_y;
		global.just_warped = true;
		timer = 5;
		pauses = 1;
	}
}
