if room == room_quiz {
	if (exploding) {
		var spd = 6;
		x += spd;
		y -= spd;
	}
	
	var _x = x - 72;
	var _y = y - 80;
	within_x = ((_x + (54*image_xscale)) <= mouse_x && mouse_x <= (_x + (100*image_xscale)));
	within_y = ((_y + (13*image_yscale)) <= mouse_y && mouse_y <= (_y + (145*image_yscale)));
	if within_x && within_y {
		if mouse_check_button_pressed(mb_left) {
			if !(exploding) {
				exploding = true;
				sprite_index = spr_tenna_hurt;
				instance_create_depth(x - 15, y - 24, depth - 2, obj_realisticexplosion);
				instance_create_depth(x + 21, y + 8, depth - 2, obj_realisticexplosion);
				instance_create_depth(x - 10, y + 30, depth - 2, obj_realisticexplosion);
			}
		}
	}
}

if sprite_index != old_sprite_index {
	old_sprite_index = sprite_index;
	bouncing = true;
	bounce_intensity = 0;
	bounce_change = 1;
}

if (bouncing) {
	bounce_intensity += bounce_change;
	if bounce_intensity == 3 {
		bounce_change = -1;
	} else if bounce_intensity == 0 && bounce_change == -1 {
		bouncing = false;
		bounce_intensity = 0;
	}
	image_xscale = scale - (bounce_intensity * 0.1)
	image_yscale = scale + (bounce_intensity * 0.1)
	debug_message(object_index, id, bounce_intensity);
	debug_message(object_index, id, bounce_change);
}