draw_sprite_ext(spr_save_nametext, image_index, x, y, 1, 1, 0, c_white, 1);

//draw the text
draw_set_font(fnt_text_big);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_text(320, 60, prompt);

var c = [ c_white, c_yellow ];
var cc = [ c_white, c_yellow ];
var _max = string_length(typedName) == max_letters;
draw_text_color(320, 100, typedName, c[_max], c[_max], cc[_max], cc[_max], 1);
draw_set_color(c_white);