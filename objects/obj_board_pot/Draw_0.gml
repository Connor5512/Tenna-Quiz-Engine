draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

if global.holding_pot == id {
	var i_costume = 0;
	var snap = 32;
	var detect_dist = 64;
	var px = obj_board_player.x + lengthdir_x(detect_dist, obj_board_player.direction);
	var py = obj_board_player.y + lengthdir_y(detect_dist, obj_board_player.direction);
	throw_x = round(px / snap) * snap;
	throw_y = round(py / snap) * snap;
	
	if place_meeting(throw_x, throw_y, obj_board_collision) || place_meeting(throw_x, throw_y, obj_board_pot) {
		i_costume = 1;
		can_throw = false;
	} else {
		can_throw = true;
	}
	draw_sprite_ext(spr_board_throwIndicator, i_costume, throw_x, throw_y, 2, 2, 0, c_white, 1);
}