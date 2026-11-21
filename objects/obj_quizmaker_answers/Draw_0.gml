text_length = string_length(text);

var optiontext_x = 110;
var optiontext_starty = 94;
var optiontext_spacing = 13;

x = optiontext_x;
y = optiontext_starty + (option * optiontext_spacing);
//draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_black, 1);

draw_set_color(color);
draw_set_font(fnt_8bit);
draw_set_halign(fa_left);
draw_text_transformed(x, y, string_upper(text), text_scale, 1, 0);
