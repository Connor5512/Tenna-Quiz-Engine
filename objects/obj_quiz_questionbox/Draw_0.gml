question_wound = string_wrap(question, sprite_width - (10 * image_xscale));

if !(setup) {
	text_length = string_length(question_wound);
}

if (draw_char != text_length) {
	draw_char += text_speed;
	if (draw_char - floor(draw_char) > 0) {
		audio_play_sound(snd_text, 10, false);
	}
}

var text = string_copy(question_wound, 1, floor(draw_char));

x = global.quiz_left + 1;
y = global.quiz_top;
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_set_color(c_white);
draw_set_font(fnt_8bit);
draw_set_halign(fa_left);
draw_text_ext(x + 7, y + 8, text, 10 * image_yscale, sprite_width - (10 * image_xscale));
