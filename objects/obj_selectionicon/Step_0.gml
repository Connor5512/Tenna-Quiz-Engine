image_index = character;

if timer > 0 {
	timer -= 1;
	exit;
}

if room == room_menu {
	if obj_menus.page == menu_pages.home {
		if keyboard_check_pressed(vk_up) {
			selection -= 1;
			audio_play_sound(snd_menumove, 10, false);
		} else if keyboard_check_pressed(vk_down) {
			selection += 1;
			audio_play_sound(snd_menumove, 10, false);
		}
		
		selection = clamp(selection, 0, obj_menus.quizes);
		
		var start_y = 33;
		var gap = 14;
		y = start_y + selection*gap;
	
		if keyboard_check_pressed(ord("Z")) && !(instance_exists(obj_txtb)) {
			audio_play_sound(snd_select, 10, false);
			if selection < obj_menus.quizes {
				global.quiz_phase = quiz_phases.init;
				room_goto(room_quiz);
				var st = instance_create_layer(0, 0, "Instances", obj_quiz_startup);
				st.startup = global.quizes[selection];
			} else {
				game_end();
			}
		}
	} else if obj_menus.page == menu_pages.options {
		if selection <= 2 {
			if keyboard_check_pressed(vk_left) {
				selection -= 1;
				audio_play_sound(snd_menumove, 10, false);
			} else if keyboard_check_pressed(vk_right) {
				if selection <= 1 {
					selection += 1;
				}
				audio_play_sound(snd_menumove, 10, false);
			} else if keyboard_check_pressed(vk_down) {
				audio_play_sound(snd_menumove, 10, false);
				selection = 3;
			}
		} else {
			if keyboard_check_pressed(vk_up) {
				audio_play_sound(snd_menumove, 10, false);
				selection = 1;
			}
		}
	
		selection = clamp(selection, 0, 3);
		
		if selection == 0 {
			x = obj_menus.kris_x;
			y = obj_menus.icon_y;
		} else if selection == 1 {
			x = obj_menus.susie_x;
			y = obj_menus.icon_y;
		} else if selection == 2 {
			x = obj_menus.ralsei_x;
			y = obj_menus.icon_y;
		} else if selection == 3 {
			x = room_width / 2;
			y = 210;
		}
		
		if keyboard_check_pressed(ord("Z")) {
			audio_play_sound(snd_select, 10, false);
			if selection == 0 {
				global.player_skin = 0;
			} else if selection == 1 {
				global.player_skin = 1;
			} else if selection == 2 {
				global.player_skin = 2;
			} else if selection == 3 {
				room_goto(room_menu);
			}
		}
	}
}
	
else if (room == room_quiz) {
	if advance {
		advance = false;
		quiz_object.current++;
		instance_destroy(obj_quiz_questionbox);
		instance_create_layer(0, 0, "Instances", obj_quiz_questionbox);
		set_option_blend(1, c_white);
		set_option_blend(2, c_white);
		set_option_blend(3, c_white);
		set_option_blend(4, c_white);
		obj_quiz_timer.image_index = 0;
		obj_quiz_timer.image_speed = 1;
		obj_quiz_timer.percent = 100;
		global.quiz_phase = quiz_phases.answer;
		answers = [ -1, -1, -1 ];
		correct_answers = [	-1, -1, -1 ];
		_x = [ -10, -10, -10 ]
		_y = [ -10, -10, -10 ]
		character = player_skins.kris;
		sound_played = false;
		selection = 0;
	}
	
	if global.quiz_phase == quiz_phases.answer {
		//selection
		if keyboard_check_pressed(vk_down) {
			selection++;
			play_sound(snd_menumove);
		} else if keyboard_check_pressed(vk_up) {
			selection--;
			play_sound(snd_menumove);
		}
		selection = clamp(selection, 0, 3);
	
		//placement
		x = quiz_x;
		var gap = sprite_width + 1;
		if selection == 0 {
			y = quiz_1;
		} else if selection == 1 {
			y = quiz_2;
		} else if selection == 2 {
			y = quiz_3;
		} else if selection == 3 {
			y = quiz_4;
		}
		if answers[0] == selection xor answers[1] == selection {
			x -= gap;
		} else if answers[0] == selection && answers[1] == selection {
			x -= gap*2;
		}
	
		//submitting
		if keyboard_check_pressed(ord("Z")) || obj_quiz_timer.percent <= 0 {
			if keyboard_check_pressed(ord("Z")) {
				play_sound(snd_select);
			}
			var incorrect = !(get_option_correct(quiz_object, selection + 1));
			if character == player_skins.kris {
				array_push(quiz_object.player1_answers, incorrect);
				correct_answers[0] = incorrect;
				character = player_skins.susie;
				answers[0] = selection;
				_x[0] = x;
				_y[0] = y;
				selection = 0;
			} else if character == player_skins.susie {
				array_push(quiz_object.player2_answers, incorrect);
				correct_answers[1] = incorrect;
				character = player_skins.ralsei;
				answers[1] = selection;
				_x[1] = x;
				_y[1] = y;
				selection = 0;
			} else if character == player_skins.ralsei {
				array_push(quiz_object.player3_answers, incorrect);
				correct_answers[2] = incorrect;
				global.quiz_phase = quiz_phases.check;
				answers[2] = selection;
				_x[2] = x;
				_y[2] = y;
				obj_quiz_timer.image_speed = 0;
			}
		
			if global.quiz_phase == quiz_phases.answer {
				obj_quiz_timer.image_index = 0;
				obj_quiz_timer.image_speed = 1;
			}
		}
	}
}

if room == room_selection_boards {
	if keyboard_check_pressed(vk_up) {
		selection -= 1;
		audio_play_sound(snd_menumove, 10, false);
	} else if keyboard_check_pressed(vk_down) {
		selection += 1;
		audio_play_sound(snd_menumove, 10, false);
	}
		
	selection = clamp(selection, 0, 4);
		
	if selection == 0 {
		y = 36;
	} else if selection == 1 {
		y = 56;
	} else if selection == 2 {
		y = 76;
	} else if selection == 3 {
		y = 96;
	} else if selection == 4 {
		y = 116;
	}
	
	if keyboard_check_pressed(ord("Z")) && !(instance_exists(obj_txtb)) {
		audio_play_sound(snd_select, 10, false);
		if selection == 0 {
			room_goto(room_board1);
		} else if selection == 1 {
			instance_create_depth(0, 0, -9998, obj_txtb);
			obj_txtb.text[0] = "This feature has not yet been implemented!";
		} else if selection == 2 {
			instance_create_depth(0, 0, -9998, obj_txtb);
			obj_txtb.text[0] = "This feature has not yet been implemented!";
		} else if selection == 3 {
			instance_create_depth(0, 0, -9998, obj_txtb);
			obj_txtb.text[0] = "This feature has not yet been implemented!";
		} else if selection == 4 {
			room_goto(room_menu);
		}
	}
}