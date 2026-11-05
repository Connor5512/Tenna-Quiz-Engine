if place_meeting(x, y, obj_board_player) {
	instance_destroy();
	global.power_croissant = true;
	audio_play_sound(snd_board_shine_get, 10, false);
	var tb = instance_create_depth(0, 0, -9998, obj_txtb);
	tb.text[0] = string_upper(skins[global.player_skin]) + " GOT THE POWER CROISSANT"
	tb.text[1] = string_upper(pronouns[global.player_skin]) + " CAN NOW PICK UP POTS AND WEEDS."
}