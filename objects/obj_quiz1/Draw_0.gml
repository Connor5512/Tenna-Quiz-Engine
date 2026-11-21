global.current_quiz_questions = array_length(questions);

if current < array_length(questions) {
	set_options(
		id,

		questions[current].option1,
		questions[current].option2,
		questions[current].option3,
		questions[current].option4,
	
		questions[current].correct,
	
		questions[current].text,
	
		questions[current].decal
	)
} else {
	if !(start_results) {
		start_results = true;
		global.quiz_phase = quiz_phases.results;
		audio_stop_all();
		instance_destroy(obj_quiz_timer);
		layer_text_destroy(global.option1);
		layer_text_destroy(global.option2);
		layer_text_destroy(global.option3);
		layer_text_destroy(global.option4);
		instance_destroy(obj_quiz_questionbox);
		obj_selectionicon.visible = false;
		decal = spr_blank;
		current_results = 1;
		var r = instance_create_depth(0, 0, 0, obj_quiz_results);
		r.answers = player1_answers;
		r.current_results = current_results;
		r.quiz = id;
	}
}

draw_sprite_ext(decal, 0, 224, 87, 1, 1, 0, c_white, 1);