confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
skip_key = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
pk_skip_key = keyboard_check(ord("C")) or keyboard_check(vk_control);

textbox_x = camera_get_view_x(view_camera[0]);

textbox_y = camera_get_view_y(view_camera[0]) + room_height - textbox_height; //down
textbox_y = camera_get_view_y(view_camera[0]); //up

//setup
if (setup == false) {
	setup = true
	
	draw_set_font(fnt_8bit);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	page_number = array_length(text);
	for (var p = 0; p < page_number; p++){
		
		//find the length of each page and store that in the text_length array
		text_length[p] = string_length(text[p]);
		
	}
}

//flip through the pages
if confirm_key {
	//is typing done?
	if draw_char == text_length[page]{
		//next page
		if page < page_number-1 {
			page++
			sound_played = false;
			draw_char = 0;
		} else
		//destroy the textbox
		{
			instance_destroy();
			if instance_exists(obj_board_player) {
				obj_board_player.can_move = true;
			}
		}
	}
} else if (skip_key || pk_skip_key) {
	// If the page isn't finished, fill it
	if draw_char != text_length[page] {
		draw_char = text_length[page];
	} else {
		// If the page *is* finished and it's the PK skip key, auto-advance
		if pk_skip_key {
			if page < page_number - 1 {
				page++;
				sound_played = false;
				draw_char = 0;
			} else {
				instance_destroy();
				if instance_exists(obj_board_player) {
					obj_board_player.can_move = true;
				}
			}
		}
	}
}

text_x_offset[page] = 8;
//type text
if draw_char < text_length[page] {
    if txtb_delay_timer > 0 {
        txtb_delay_timer -= 1;
    } else {
        draw_char += text_speed;
        draw_char = clamp(draw_char, 0, text_length[page]);

        var current_char = floor(draw_char);
        if (current_char > 0 && current_char <= text_length[page]) {
            var last_char = string_char_at(text[page], current_char);
            var next_char = string_char_at(text[page], current_char + 1);

            var pause_period = round(text_speed * 8);
            var pause_ellipsis = round(text_speed * 12); // longer pause for ellipsis periods
            var pause_comma = round(text_speed * 4);

            if (last_char == ".") {
                // Check if part of an ellipsis
                if (next_char == ".") {
                    // Still in ellipsis, pause for each dot with longer delay
                    txtb_delay_timer = pause_ellipsis;
                } else {
                    // Last dot in ellipsis or just a single period
                    txtb_delay_timer = pause_ellipsis;
                }
            } else if (last_char == "!" || last_char == "?") {
                if (next_char != last_char) {
                    txtb_delay_timer = pause_period;
                }
            } else if (last_char == ",") {
                if (next_char != ",") {
                    txtb_delay_timer = pause_comma;
                }
            }
        }
    }
} else {
	if !(sound_played) {
		sound_played = true;
		audio_play_sound(snd_board_text_main_end, 10, false);
	}
}

//draw textbox
txtb_image += txtb_image_spd;
txtb_sprite_w = sprite_get_width(txtb_sprite);
txtb_sprite_h = sprite_get_height(txtb_sprite);

draw_sprite_ext(txtb_sprite,txtb_image,textbox_x,textbox_y,textbox_width/txtb_sprite_w,textbox_height/txtb_sprite_h,0,c_white,1)

//draw the speaker
if draw_char >= text_length[page] {
	draw_sprite(spr_custommenu_arrow, 0, textbox_x + textbox_width - 25, textbox_y + textbox_height - 20);
}
//draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_set_font(fnt_8bit);
draw_set_color(c_white);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);