if place_meeting(x, y, obj_board_player) {
	instance_destroy();
	global.inventory[2].count = 1;
	audio_play_sound(snd_board_shine_get, 10, false);
	var tb = instance_create_depth(0, 0, -9998, obj_txtb);
	tb.text[0] = "YOU GOT THE MOONCLOUD STONE!";
}