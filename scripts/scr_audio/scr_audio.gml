/// @function                   scr_bgm_set
/// @description        Plays and loops the provided Sound Asset as the room's background music.
/// @param  {Asset.GMSound}    sound    The sound to loop as the new background music
/// @param  {Bool}    reset    Whether or not to always restart the background music when the function is run

function scr_bgm_set(sound, reset = false) {
	if (variable_global_exists("bgm") || reset) {
		audio_stop_sound(global.bgm);
	}
	global.bgm = audio_play_sound(sound, 10, true);
}

/// @function                   scr_bgm_stop
/// @description        Stops playing the room's background music.

function scr_bgm_stop() {
	audio_stop_sound(global.bgm);
	global.bgm = audio_play_sound(snd_nosound, 10, true);
}

///	@description This function is a combination of the base audio_play_sound() function with the audio_sound_gain() and audio_sound_pitch() functions, permitting you to play any Sound Asset in your game while allowing you to immediately fade in or out the sound, and also lets you play the sound with the pitch already set.
///	@param {Asset.GMSound} index The index of the sound to play.
///	@param {Real} volume Value for the music volume.
///	@param {Real} time The length for the change in gain in milliseconds.
///	@param {Real} pitch The pitch multiplier (default 1).

function play_sound(index, level = 1, time = 0, pitch = 1) {
	var sound = audio_play_sound(index, 10, false);
	audio_sound_gain(sound, level, time);
	audio_sound_pitch(sound, pitch)
	return sound;
}