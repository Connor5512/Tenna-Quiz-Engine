var spr = spr_logo1;
var index = 0;
if audio_is_playing(audio) {
	if audio_sound_get_track_position(audio) <= 3.59 {
		if (logo_alpha < 1) {
			logo_alpha += fade_in_speed;
			wave_timer += wave_speed;
		} else if (pause_timer == 0) {
			logo_alpha -= fade_in_speed;
			wave_timer += wave_speed;
		}

		wave_amplitude = max_amplitude * (1 - logo_alpha);
		if wave_amplitude <= 2 {
			wave_amplitude = 0;
		}
	} else {
		index = 1;
		wave_amplitude = 0;
		if !(fade_speed_set) {
			fade_speed = 1 / ((audio_sound_length(audio) - audio_sound_get_track_position(audio)) * 60);
			fade_speed_set = true;
		}
		logo_alpha -= fade_speed;
	}
} else {
	audio_stop_all();
	room_goto(room_nicknames);
	draw_set_alpha(1);
}

var w = sprite_width;
var h = sprite_height;
var strip_height = 2;

draw_set_alpha(logo_alpha);
draw_set_color(c_white);

for (var i = 0; i < h; i += strip_height) {
    var strip_index = i div strip_height;
    var waveDirection = (strip_index mod 2 == 0) ? 1 : -1;
    var wave_offset = sin(wave_timer + i * wave_frequency) * wave_amplitude * waveDirection;

    draw_sprite_part_ext(
        spr, index,
        0, i, w, strip_height,
        x + wave_offset, y + 2 * i,
        2, 2, c_white, logo_alpha
    );
}

if (pause_timer > 0) {
    pause_timer -= 1;
	debug_message(object_index, id, string(pause_timer));
}