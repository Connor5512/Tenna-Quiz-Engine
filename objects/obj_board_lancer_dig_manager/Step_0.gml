if timer > 0 {
	timer -= 1;
	exit;
}

if rocks < 8 {
	rocks += 1;
	var rock = instance_create_layer(0, 0, "Puzzles", obj_board_lancer_dig_rock);
	rock.rock_id = rocks;
} else {
	instance_create_layer(592, 640, "Player", obj_board_key);
	instance_destroy();
}

timer = 45;