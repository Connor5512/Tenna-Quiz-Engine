percent = (1) * 100;

var sprite_y = 145 //global.quiz_bottom - 1 - (sprite_height);
var sprite = spr_quiz_hud_timer_frozen;
var col = [
	c_white,
	c_white
]

draw_sprite_ext(sprite, image_index, global.quiz_left + 1, sprite_y, 1, 1, 0, c_white, 1);
//draw_sprite_part_ext(sprite, image_index, 0, 0, sprite_get_width(sprite), sprite_get_height(sprite)/2, global.quiz_left + 1, sprite_y, 1, 1, col[0], 1);
//draw_sprite_part_ext(sprite, image_index, 0, sprite_get_height(sprite)/2, sprite_get_width(sprite), sprite_get_height(sprite), global.quiz_left + 1, sprite_y + sprite_get_height(sprite)/2, 1, 1, col[1], 1);

var bg_blend = layer_background_get_blend(layer_background_get_id("Background"))
var healthbar_y = 148 //sprite_y + 8;
sprite = spr_quiz_bottomtimebar;

draw_healthbar(83, 150, 252, 152, percent, bg_blend, c_red, col[0], 0, false, false);
draw_sprite_part_ext(sprite, 0, 0, 0, sprite_get_width(sprite), sprite_get_height(sprite)/2, 80, healthbar_y, 1, 1, col[0], 1);

draw_healthbar(83, 152, 252, 154, percent, bg_blend, c_red, col[1], 0, false, false);
draw_sprite_part_ext(sprite, 0, 0, sprite_get_height(sprite)/2, sprite_get_width(sprite), sprite_get_height(sprite), 80, healthbar_y + sprite_get_height(sprite)/2, 1, 1, col[1], 1);