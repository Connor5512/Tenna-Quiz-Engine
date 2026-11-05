if (room == room_nicknames) {
	//X values --
	if (obj_save_nameing.image_index = 0 || obj_save_nameing.image_index = 10 || obj_save_nameing.image_index = 20) {
		dx = 103;
	} else if (obj_save_nameing.image_index = 1 || obj_save_nameing.image_index = 11 || obj_save_nameing.image_index = 21) {
		dx = 151;
	} else if (obj_save_nameing.image_index = 2 || obj_save_nameing.image_index = 12 || obj_save_nameing.image_index = 22) {
		dx = 199;
	} else if (obj_save_nameing.image_index = 3 || obj_save_nameing.image_index = 13 || obj_save_nameing.image_index = 23) {
		dx = 247;
	} else if (obj_save_nameing.image_index = 4 || obj_save_nameing.image_index = 14 || obj_save_nameing.image_index = 24) {
		dx = 295;
	} else if (obj_save_nameing.image_index = 4 || obj_save_nameing.image_index = 14 || obj_save_nameing.image_index = 24) {
		dx = 295;
	} else  if (obj_save_nameing.image_index = 5 || obj_save_nameing.image_index = 15 || obj_save_nameing.image_index = 25) {
		dx = 343;
	} else if (obj_save_nameing.image_index = 6 || obj_save_nameing.image_index = 16) {
		dx = 391;
	} else if (obj_save_nameing.image_index = 7 || obj_save_nameing.image_index = 17) {
		dx = 439;
	} else if (obj_save_nameing.image_index = 8 || obj_save_nameing.image_index = 18) {
		dx = 487;
	} else if (obj_save_nameing.image_index = 9 || obj_save_nameing.image_index = 19) {
		dx = 535;
	} else if (obj_save_nameing.image_index = 26) {
		dx = 415;
	} else if (obj_save_nameing.image_index = 27) {
		dx = 502;
	}
	
	//Y values --
	if (obj_save_nameing.image_index <= 9) {
		dy = 195;
	} else if (obj_save_nameing.image_index <= 19) {
		dy = 240;
	} else if (obj_save_nameing.image_index <= 27) {
		dy = 285;
	}
	
	if x != dx {
		x = lerp(x, dx, 0.2);
		if (abs(x - dx) <= 2) {
		    x = dx;
		}
	}
	if y != dy {
		y = lerp(y, dy, 0.2);
		if (abs(y - dy) <= 2) {
		    y = dy;
		}
	}
	
	draw_sprite_ext(sprite_index , image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5);
}