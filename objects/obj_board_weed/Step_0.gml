if place_meeting(x, y, obj_board_player) && global.power_croissant && keyboard_check_pressed(ord("Z")) {
	instance_destroy();
	
	var pick_sprites = [
		spr_kris_board_pick,
		spr_susie_board_pick,
		spr_ralsei_board_pick
	]
	obj_board_player.sprite_index = pick_sprites[global.player_skin];
	obj_board_player.image_index = 1;
	obj_board_player.image_speed = 1;
	obj_board_player.can_move = false;
	
	instance_create_depth(obj_board_player.x - 16, obj_board_player.y - 32, layer_get_depth("Player") - 1, obj_board_weed_coin);
}