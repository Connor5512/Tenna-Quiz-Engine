draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_xscale, 0, color, 1);
scale = round(drawn_scale*100);

draw_set_halign(fa_center);
draw_set_color(color);
draw_text(x + (image_xscale*sprite_get_width(sprite_index))/2, y + 2, string(scale) + "%")

draw_set_halign(fa_left);
draw_set_color(c_white);