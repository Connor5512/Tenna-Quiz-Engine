if variable_global_exists("current_music") {
	audio_stop_sound(global.current_music);
}
audio_play_sound(TV_GAME, 10, true);
global.current_music = TV_GAME;