function draw_text_shadowed(x, y, string, shadow_size, main_color = draw_get_color(), shadow_color = c_black) {
	var old_col = draw_get_color();
	draw_set_color(shadow_color);
	draw_text(x + shadow_size, y + shadow_size, string);
	draw_set_color(main_color);
	draw_text(x, y, string);
	draw_set_color(old_col);
}

function draw_text_shadowed_ext(x, y, string, sep, w, shadow_size, main_color = draw_get_color(), shadow_color = c_black) {
	var old_col = draw_get_color();
	draw_set_color(shadow_color);
	draw_text_ext(x + shadow_size, y + shadow_size, string, sep, w);
	draw_set_color(main_color);
	draw_text_ext(x, y, string, sep, w);
	draw_set_color(old_col);
}

clicked = false;
key = false;