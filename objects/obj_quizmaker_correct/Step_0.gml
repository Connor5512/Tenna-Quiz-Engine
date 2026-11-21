if cursor_hovering(id) {
	color = c_yellow;
} else {
	color = c_white;
}

var current_correct = string(obj_quiz_new.questions[obj_quiz_new.current].correct);
if state == quiz_creator_button_states.normal {
	if cursor_hovering(id) {
		if mouse_check_button_pressed(mb_left) {
			
			if !(string_contains(current_correct, string(option + 1))) {
				current_correct = string_append(current_correct, string(option + 1));
			} else {
				current_correct = string_replace(current_correct, string(option + 1), "");
			}
			
			if current_correct == "" {
				current_correct = "0";
			}
			
			obj_quiz_new.questions[obj_quiz_new.current].correct = real(current_correct);
		}
	}
}

image_index = !(string_contains(current_correct, string(option + 1))) + 17;
var optiontext_x = 110;
var optiontext_starty = 94;
var optiontext_spacing = 13;

x = optiontext_x - 10;
y = optiontext_starty + (option * optiontext_spacing) + 3;