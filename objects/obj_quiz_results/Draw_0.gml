draw_rectangle_color(0, 0, room_width, room_height, #00A2E8, #00A2E8, #00A2E8, #00A2E8, false);
var skin = current_results - 1;
	
draw_sprite_ext(spr_quiz_results_box, 0, 0, 84.5, 5, 0.2734375, 0, c_white, 1);
draw_sprite_ext(spr_quiz_results, 0, 160, 56, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_quiz_player, skin, 160, 194, 2, 2, 0, c_white, 1);

var mid = room_width/2;
var _y = 92;
for (var i = 0; i < shown_answers; i++) {
	var scale = 1.5;
	var width = 9 * scale;
	var sep = 2 * scale;
	var left = mid - ((0.5*global.current_quiz_questions)*width) - (((0.5*global.current_quiz_questions))*sep) + 2*sep;
	
	col = [
		#8DEDFE,
		#F22D81,
		#13D26F
	]
	
	draw_sprite_ext(spr_quiz_answer_cursor, answers[i] + 17, left + i*width + i*sep, _y, scale, scale, 0, col[skin], 1);
}

if state >= results_states.calculating {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(mid, 124, "SCORE", 1.5, 1.5, 0);
	if state == results_states.scored {
		draw_text_transformed(mid, 144, _score, 1.5, 1.5, 0);
	}
}

if timer > 0 {
	timer--;
	exit;
}

if shown_answers < global.current_quiz_questions {
	shown_answers++;
	if answers[shown_answers-1] { //returns true for incorrect answers
		play_sound(snd_hurt1);
	} else {
		play_sound(snd_coin);
		correct_answers++;
	}
	
	show_debug_message("shown_answers : " + string(shown_answers));
	show_debug_message("global.current_quiz_questions : " + string(global.current_quiz_questions));
	timer = 15;
} else {
	if state != results_states.calculating && !(drumroll_started) {
		state = results_states.calculating
	}
	
	if state == results_states.calculating {
		if !(drumroll_started) {
			drumroll_started = true;
			audio = play_sound(snd_drumroll)
			timer = 90;
		} else {
			audio = play_sound(snd_cymbal);
			_score = string(100*(correct_answers/global.current_quiz_questions)) + "%";
			state = results_states.scored;
		}
	}
}

if state == results_states.scored && !(audio_is_playing(audio)) {
	if keyboard_check_pressed(ord("Z")) {
		instance_destroy();
		var r = instance_create_depth(0, 0, 0, obj_quiz_results);
		if current_results == 1 {
			r.answers = quiz.player2_answers;
			r.current_results = 2;
			r.quiz = quiz;
		} else if current_results == 2 {
			r.answers = quiz.player3_answers;
			r.current_results = 3;
			r.quiz = quiz;
		} else if current_results == 3 {
			if instance_exists(obj_selectionicon) obj_selectionicon.visible = true;
			room_goto(room_menu);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		}
	}
}