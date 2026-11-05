draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_color(x+17, y+14, nickname, c_black, c_black, c_black, c_black, 0.2313725490196078);
draw_text_color(x+17, y+13, nickname, c_white, c_white, c_white, c_white, 1);