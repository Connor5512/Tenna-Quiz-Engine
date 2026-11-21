function clicked_by_cursor(_id, _mouse_button = mb_left){
	var hover = position_meeting(mouse_x, mouse_y, id);
	var click = mouse_check_button_pressed(_mouse_button);
	
	return hover && click;
}

function cursor_hovering(_id){
	var hover = position_meeting(mouse_x, mouse_y, id);
	
	return hover;
}