x = camera_get_view_x(view_camera[0])+5;
y = camera_get_view_y(view_camera[0])+236;

global.points = clamp(global.points, global.points, 9999);

image_xscale = 3.117647058823529;
draw_sprite_ext(spr_bar, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);

var left_side = x + 10;
var right_side = (x + sprite_width) - 10;
var font_y = y - 6;
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text(right_side, font_y, string(global.points));
draw_set_halign(fa_left);
draw_text(left_side, font_y, "P");