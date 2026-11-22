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
		
		selection = clamp(selection, 0, obj_menus.quizes + 2);
		
		var start_y = 33;
		var gap = 14;
		y = start_y + selection*gap;
	
		if keyboard_check_pressed(ord("Z")) && !(instance_exists(obj_txtb)) {
			audio_play_sound(snd_select, 10, false);
			if selection < obj_menus.quizes {
				global.quiz_phase = quiz_phases.init;
				var st = instance_create_layer(0, 0, "Instances", obj_quiz_handler);
				st.startup = global.quizes[selection].path;
				st.mode = quiz_modes.import;
			} else {
				if selection == obj_menus.quizes {
					var filepath = get_open_filename("Tenna Quiz Files (*.quiz)|*.quiz", "");
					
					if filepath == "" {
						debug_message(object_index, id, "File import canceled by user.");
						exit;
					}
					
					var copy_directory = "imports/";
					
					var newpath = copy_directory + filename_name(filepath);
					file_copy(filepath, newpath);
					
					directory_destroy("temp/unzip/")
					zip_unzip(newpath, "temp/unzip/");
					
					var properties = load_json("temp/unzip/quiz_properties.json")
					var __author = properties.__author;
					var bank_name = properties.bank_name;
					
					var buffer = buffer_load("temp/unzip/questions.json");
					var json = buffer_read(buffer, buffer_text);
					buffer_delete(buffer);
	
					var data = json_decode(json);
					var ds_keys = ds_map_keys_to_array(data);
					//debug_message(object_index, id, ds_keys);
	
					for (var i = 0; i < array_length(ds_keys); i++) {
						var json_questions = ds_map_find_value(data, "questions");
						var reconstructed_questions = [];

						for (var j = 0; j < ds_list_size(json_questions); j++) {
							var question = ds_list_find_value(json_questions, j);
				
							array_push(reconstructed_questions, {
								text: ds_map_find_value(question, "text"),
								option1: ds_map_find_value(question, "option1"),
								option2: ds_map_find_value(question, "option2"),
								option3: ds_map_find_value(question, "option3"),
								option4: ds_map_find_value(question, "option4"),
								correct: ds_map_find_value(question, "correct"),
								decal: ds_map_find_value(question, "decal")
							});
						}

						questions = reconstructed_questions;
					}
					
					directory_destroy("temp/unzip/");
					
					array_push(global.quizes, 
						{
							path: newpath,
							bank_name: bank_name,
							__author: __author,
							questions: array_length(questions)
						}
					);
				} else if selection == obj_menus.quizes + 1 {
					room_goto(room_quiz_creator);
				} else {
					game_end();
				}
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