if file_exists("player.ini") {
	ini_open("player.ini");
	if ini_read_string("NICKNAMES", "P3", "-1") != "-1" {
		room_goto(room_title);
		exit;
	}
}

selected_player = 0;