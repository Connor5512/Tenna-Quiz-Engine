var camera_width = camera_get_view_width(view_camera[0]);
var camera_height = camera_get_view_height(view_camera[0]);
camera_d = y + (camera_height/2);
camera_u = y - (camera_height/2);
camera_r = x + (camera_width/2);
camera_l = x - (camera_width/2);

if obj_board_player.y >= camera_d || (panning_down) {
	panning_down = true;
	obj_board_player.can_move = false;
	if !(target_y_set) {
		target_y_set = true;
		target_y = y + camera_height;
	}
	y += pan_speed;
	if abs(y - target_y) <= 1 || (global.just_warped) {
		y = target_y;
		panning_down = false;
		obj_board_player.can_move = true;
		target_y_set = false;
	}
}

if obj_board_player.y < camera_u || (panning_up) {
	panning_up = true;
	obj_board_player.can_move = false;
	if !(target_y_set) {
		target_y_set = true;
		target_y = y - camera_height;
	}
	y -= pan_speed;
	if abs(y - target_y) <= 1 || (global.just_warped) {
		y = target_y;
		panning_up = false;
		obj_board_player.can_move = true;
		target_y_set = false;
	}
}

if obj_board_player.x >= camera_r || (panning_right) {
	panning_right = true;
	obj_board_player.can_move = false;
	if !(target_x_set) {
		target_x_set = true;
		target_x = x + camera_width;
	}
	x += pan_speed;
	if abs(x - target_x) <= 1 || (global.just_warped) {
		x = target_x;
		panning_right = false;
		obj_board_player.can_move = true;
		target_x_set = false;
	}
}

if obj_board_player.x < camera_l || (panning_left) {
	panning_left = true;
	obj_board_player.can_move = false;
	if !(target_x_set) {
		target_x_set = true;
		target_x = x - camera_width;
	}
	x -= pan_speed;
	if abs(x - target_x) <= 1 || (global.just_warped) {
		x = target_x;
		panning_left = false;
		obj_board_player.can_move = true;
		target_x_set = false;
	}
}