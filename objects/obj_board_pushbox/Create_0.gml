target_x = x;
target_y = y;

function can_push_to(push_x, push_y) {
	return (place_meeting(push_x, push_y, obj_board_pushpath) || place_meeting(push_x, push_y, obj_board_pushbutton)) && !(place_meeting(x, y, obj_board_pushbutton))
}