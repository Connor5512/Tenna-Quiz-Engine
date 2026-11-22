var a = [
	0.5,
	1
]

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, color, 1);

draw_set_halign(fa_center);
draw_set_color(color);
draw_text(x + (sprite_get_width(sprite_index) * image_xscale)/2, y+(8*image_yscale), "Export");

draw_set_halign(fa_left);
draw_set_color(c_white);