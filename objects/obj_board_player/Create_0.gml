down_sprites = [
	spr_kris_board_down,
	spr_susie_board_down,
	spr_ralsei_board_down
]

left_sprites = [
	spr_kris_board_left,
	spr_susie_board_left,
	spr_ralsei_board_left
]

right_sprites = [
	spr_kris_board_right,
	spr_susie_board_right,
	spr_ralsei_board_right
]

up_sprites = [
	spr_kris_board_up,
	spr_susie_board_up,
	spr_ralsei_board_up
]

block_sprites = [
	spr_kris_board_block,
	spr_susie_board_block,
	spr_ralsei_board_block
]

sprite_index = down_sprites[global.player_skin];

function collision_check(x, y) {
	if place_meeting(x, y, obj_board_collision) || place_meeting(x, y, obj_board_pushbox) || place_meeting(x, y, obj_board_pushcactus) || place_meeting(x, y, obj_board_pushpyramid) {
		return true;
	}
	if place_meeting(x, y, obj_board_pot) {
		if global.holding_pot != instance_position(x, y, obj_board_pot) {
			return true;
		}
	}
}

move_spd = 1.5;
can_move = true;

global.inventory = [
	{name: "KEY", count: 0},
	{name: "LANCER", count: 0},
	{name: "MOONCLOUD STONE", count: 0}
]

layer_set_visible("WaterStop", false);