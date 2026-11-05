if timer > 0 {
	timer -= 1;
	exit;
}

if !(audio) {
	audio_play_sound(snd_nes_intro_extended_part2, 10, false);
	global.current_music = snd_nes_intro_extended_part2;
	audio = true;
}