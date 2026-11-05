var pick_sprites = [
	spr_kris_board_pick,
	spr_susie_board_pick,
	spr_ralsei_board_pick
]

if array_contains(pick_sprites, sprite_index) {
	can_move = true;
	sprite_index = down_sprites[global.player_skin];
	instance_create_depth(x, y, depth-1, obj_board_pointsAdd)
	obj_board_pointsAdd.image_index = 5;
	exit;
}