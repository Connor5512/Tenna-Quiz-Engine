function get_option_correct(quiz_object, option){
	return array_contains(quiz_object.correct_answers, option);
}