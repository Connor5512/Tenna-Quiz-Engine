var time = 28 - image_index;
percent = (time/28) * 100;

var sprite_y = 145 //global.quiz_bottom - 1 - (sprite_height);
draw_sprite_ext(spr_quiz_hud_timer, image_index, global.quiz_left + 1, sprite_y, 1, 1, 0, c_white, 1);
var bg_blend = layer_background_get_blend(layer_background_get_id("Background"))
var healthbar_y = 148 //sprite_y + 8;
draw_healthbar(83, 150, 252, 154, percent, bg_blend, c_red, c_white, 0, false, false);
draw_sprite_ext(spr_quiz_bottomtimebar, 0, 80, healthbar_y, 1, 1, 0, c_white, 1);