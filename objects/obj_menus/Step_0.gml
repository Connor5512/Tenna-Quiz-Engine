if !(mus) {
	mus = true;
	audio_play_sound(ch3_tvtime, 10, true);
	global.current_music = ch3_tvtime;
	show_debug_message(global.current_music);
	instance_create_layer(40, 36, "Instances", obj_selectionicon);
}