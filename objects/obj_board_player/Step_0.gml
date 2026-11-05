var x_spd = 0;
var y_spd = 0;
if (can_move) {
	if keyboard_check(vk_down) {
		sprite_index = down_sprites[global.player_skin];
		direction = 270;
		y_spd = move_spd;
	}
	
	if keyboard_check(vk_left) {
		sprite_index = left_sprites[global.player_skin];
		direction = 180;
		x_spd = -move_spd;
	}
	
	if keyboard_check(vk_right) {
		sprite_index = right_sprites[global.player_skin];
		direction = 0;
		x_spd = move_spd;
	}
	
	if keyboard_check(vk_up) {
		sprite_index = up_sprites[global.player_skin];
		direction = 90;
		y_spd = -move_spd;
	}
	
	if collision_check(x, y + y_spd) {
		y_spd = 0;
	}
	if collision_check(x + x_spd, y) {
		x_spd = 0;
	}

	y += y_spd;
	x += x_spd;

	if x_spd == 0 && y_spd == 0 {
		image_speed = 0;
	} else {
		image_speed = 1;
	}
}

if place_meeting(x, y, obj_board_pushbutton) && keyboard_check_pressed(ord("Z")) {
	if !(array_contains(block_sprites, sprite_index)) {
		x = instance_nearest(x, y, obj_board_pushbutton).x + 16;
		y = instance_nearest(x, y, obj_board_pushbutton).y + 16;
		sprite_index = block_sprites[global.player_skin];
		can_move = false;
	} else {
		can_move = true;
		sprite_index = down_sprites[global.player_skin];
	}
}