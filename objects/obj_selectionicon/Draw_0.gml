draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, draw_alpha);
if room == room_quiz {
	var check = global.quiz_phase == quiz_phases.check;
	if check {
		draw_alpha = 0.5;
	} else {
		draw_alpha = 1;
	}
	
	draw_sprite_ext(sprite_index, 0, _x[0], _y[0], image_xscale, image_yscale, 0, c_white, 0.5);
	draw_sprite_ext(sprite_index, 1, _x[1], _y[1], image_xscale, image_yscale, 0, c_white, 0.5);
	
	if check {
		var col = [
			//c_aqua,
			c_red,
			c_lime
		]
		for (var i = 0; i < 3; i++) {
			var overlay = correct_answers[i] + 17;
			if !(sound_played) {
				sound_played = true;
				if overlay == 18 {
					play_sound(snd_hurt1);
				} else {
					play_sound(snd_coin);
				}
				
				timer = 60;
				advance = true;
				show_correct_options(quiz_object);
			}
			draw_sprite_ext(spr_quiz_answer_cursor, overlay, _x[i], _y[i], image_xscale, image_yscale, 0, col[(overlay - 17 == 0)], 1);
			global.answers[i] = overlay;
		}
	}
} else if room == room_menu {
	var __x = 252;
	var __y = 60;
	
	var text = "";
	if selection < obj_menus.quizes {
		text =	global.quizes[selection].bank_name;
	} else {
		text =	"N/A" + "\n"
	}
	draw_set_color(c_black);
	draw_set_font(fnt_8bit);
	draw_set_halign(fa_center);
	
	var limit = 82;
	if string_width(text) >= limit {
		text_scale = ((limit-2)/string_width(text));
	} else {
		text_scale = 1;
	}
	draw_text_transformed(__x, __y, text, text_scale, 1, 0);
	
	if selection < obj_menus.quizes {
		text =	"\n" +
				"By " + global.quizes[selection].__author;
	} else {
		text =	"\n" +
				"By " + "N/A";
	}
	
	if string_width(text) >= limit {
		text_scale = ((limit-2)/string_width(text));
	} else {
		text_scale = 1;
	}
	draw_text_transformed(__x, __y, text, text_scale, 1, 0);
	
	if selection < obj_menus.quizes {
		text =	"\n\n\n" + string(global.quizes[selection].questions) + "\nquestions";
	} else {
		text =	"\n\n\n" + "N/A" + "\nquestions";
	}
	draw_text(__x, __y, text);
	
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
}