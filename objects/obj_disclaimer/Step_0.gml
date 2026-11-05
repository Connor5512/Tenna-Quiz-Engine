if mouse_check_button_pressed(mb_left) {
	clicked = true;
}

if keyboard_check_pressed(vk_anykey) {
	key = true;
}

if (key) && (clicked) {
	room_goto(room_title);
}