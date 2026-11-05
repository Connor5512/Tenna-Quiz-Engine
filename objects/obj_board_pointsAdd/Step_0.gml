if !(points_added) {
	global.points += image_index;
	points_added = true;
	audio_play_sound(snd_scorecollect, 10, false);
}

y -= 1;

if y <= ystart - 10 {
	instance_destroy();
}