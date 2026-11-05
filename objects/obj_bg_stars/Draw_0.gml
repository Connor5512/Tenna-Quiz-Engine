sprites = [
	spr_stars_dkblue,
	spr_stars_ltblue,
	spr_stars_red
]

sprite_index = sprites[col];

offset += scroll_speed;

draw_sprite_tiled(sprite_index, image_index, _x - offset, _y + offset);