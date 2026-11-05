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
}