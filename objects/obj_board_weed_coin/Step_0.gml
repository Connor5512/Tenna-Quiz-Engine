var pick_sprites = [
	spr_kris_board_pick,
	spr_susie_board_pick,
	spr_ralsei_board_pick
]

if !(array_contains(pick_sprites, obj_board_player.sprite_index)) {
	instance_destroy();
}