question_wound = string_upper(string_wrap(question, sprite_width - (10 * image_xscale)));
text_length = string_length(question_wound);

var text = question_wound;

x = global.quiz_left + 1;
y = global.quiz_top;
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, color, 1);
draw_set_color(color);
draw_set_font(fnt_8bit);
draw_set_halign(fa_left);
draw_text_ext(x + 7, y + 8, text, 10 * image_yscale, sprite_width - (10 * image_xscale));
