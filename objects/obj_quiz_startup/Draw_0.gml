draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_8bit);
draw_text_color(global.quiz_left + (global.quiz_width/2), global.quiz_top + (global.quiz_height/2), "QUIZ", c_white, c_white, c_white, c_white, 1);

if !(audio_is_playing(audio)) {
	if startup != noone		instance_create_layer(0, 0, "Instances", startup);
	instance_destroy();
	instance_create_depth(0, 0, 0, obj_mus_quiz);
}