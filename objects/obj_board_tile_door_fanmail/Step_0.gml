if y >= obj_board_cameraguide.camera_u && y <= obj_board_cameraguide.camera_d && x >= obj_board_cameraguide.camera_l && x <= obj_board_cameraguide.camera_r {
	image_speed	= 1;
} else {
	image_speed = 0;
	image_index = 0;
}