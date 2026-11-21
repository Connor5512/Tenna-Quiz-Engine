draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_8bit);
draw_text_color(global.quiz_left + (global.quiz_width/2), global.quiz_top + (global.quiz_height/2), "QUIZ", c_white, c_white, c_white, c_white, 1);

if !(audio_is_playing(audio)) {
	if !(given) {
		if startup != noone	{
			instance_create_layer(0, 0, "Instances", startup);
		}
	} else {
		var quiz = instance_create_layer(0, 0, "Instances", obj_quiz);
		quiz.__author = __author;
		quiz.bank_name = bank_name;
		quiz.questions = questions;
	}
	instance_destroy();
	var i = instance_create_depth(0, 0, 0, obj_mus);
	i.music = TV_GAME;
}