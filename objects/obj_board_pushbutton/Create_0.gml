puzzle_id = 1;
solved = false;

function within_camera_view() {
	return y >= obj_board_cameraguide.camera_u && y <= obj_board_cameraguide.camera_d && x >= obj_board_cameraguide.camera_l && x <= obj_board_cameraguide.camera_r;
}

block_sprites = [
	spr_kris_board_block,
	spr_susie_board_block,
	spr_ralsei_board_block
]