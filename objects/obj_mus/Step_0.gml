if variable_global_exists("current_music") {
	if audio_sound_get_asset(global.current_music) != music {
		audio_stop_sound(global.current_music);
		global.current_music = audio_play_sound(music, 10, loop);
	} else {
		debug_message(object_index, id, "Music not set; new music is same as current");
	}
}

instance_destroy();