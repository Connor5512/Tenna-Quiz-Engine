function set_options(quiz_object, option1, option2, option3, option4, correct, question, decal = spr_blank){
	layer_text_text(global.option1, string_upper(option1));
	layer_text_text(global.option2, string_upper(option2));
	layer_text_text(global.option3, string_upper(option3));
	layer_text_text(global.option4, string_upper(option4));
	obj_quiz_questionbox.question = string_upper(question);
	quiz_object.decal = decal;
	
	quiz_object.correct_answers = [];
	for (var i = 0; i < string_length(correct); i++) {
		quiz_object.correct_answers[i] = real(string_copy(correct, i+1, 1));
	}
	obj_selectionicon.quiz_object = quiz_object;
}

function innit_options() {
	var optiontext_x = 110;
	var optiontext_starty = 94;
	var optiontext_spacing = 13;
	global.option1 = layer_text_create(layer_get_id("Text"), optiontext_x, optiontext_starty, fnt_8bit, "");
	global.option2 = layer_text_create(layer_get_id("Text"), optiontext_x, optiontext_starty + (1 * optiontext_spacing), fnt_8bit, "");
	global.option3 = layer_text_create(layer_get_id("Text"), optiontext_x, optiontext_starty + (2 * optiontext_spacing), fnt_8bit, "");
	global.option4 = layer_text_create(layer_get_id("Text"), optiontext_x, optiontext_starty + (3 * optiontext_spacing), fnt_8bit, "");
	
	instance_create_depth(0, 0, -9998, obj_quiz_questionbox);
	instance_create_depth(0, 0, -9998, obj_selectionicon);
	var offset = 3;
	obj_selectionicon.quiz_1 = optiontext_starty + offset;
	obj_selectionicon.quiz_2 = optiontext_starty + (1 * optiontext_spacing) + offset;
	obj_selectionicon.quiz_3 = optiontext_starty + (2 * optiontext_spacing) + offset;
	obj_selectionicon.quiz_4 = optiontext_starty + (3 * optiontext_spacing) + offset;
}

function set_option_blend(option, color){
	if option == 1 {
		layer_text_blend(global.option1, color);
	} else if option == 2 {
		layer_text_blend(global.option2, color);
	} else if option == 3 {
		layer_text_blend(global.option3, color);
	} else if option == 4 {
		layer_text_blend(global.option4, color);
	}
}

function show_correct_options(quiz_object, color = c_yellow) {
	if array_contains(quiz_object.correct_answers, 1) {
		set_option_blend(1, color)
	}
	if array_contains(quiz_object.correct_answers, 2) {
		set_option_blend(2, color)
	}
	if array_contains(quiz_object.correct_answers, 3) {
		set_option_blend(3, color)
	}
	if array_contains(quiz_object.correct_answers, 4) {
		set_option_blend(4, color)
	}
}