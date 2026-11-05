obj_board_player.can_move = false;

if pauses == 0 {
	if !(instance_exists(obj_txtb)) {
		pauses = 1;
		sprite_index = spr_lancer_board_dig;
		image_speed = 1;
		audio_sound_gain(global.current_music, 0, 0);
		snd = audio_play_sound(board_lancer_dig, 10, false);
		instance_create_depth(0, 0, 0, obj_board_lancer_dig_manager);
	}
}

if pauses == 1 {
	if !(audio_is_playing(snd)) {
		audio_sound_gain(global.current_music, 1, 0);
		snd = 0;
		pauses = 2;
		sprite_index = spr_lancer_board;
		image_index = 0;
		image_speed = 0;
		instance_destroy(inst_57716AD9);
		instance_destroy(inst_5ADB7849);
		instance_destroy(inst_19DA4F81);
		layer_set_visible("WaterStop", true);
		instance_create_depth(0, 0, -9998, obj_txtb);
		obj_txtb.text[0] = "HOW'S THAT!? A KEY FOR YOU!!";
		obj_txtb.text[1] = "AS A BONUS, I BLOCKED THE WATER FROM FLOWING.";
		obj_txtb.text[2] = "BYE NOW!";
		instance_destroy();
	}
}