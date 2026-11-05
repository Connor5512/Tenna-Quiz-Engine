ini_open("player.ini");
nickname = ini_read_string("NICKNAMES", "P" + string(skin), "AAA");
char.skin = skin - 1;

if global.quiz_phase == quiz_phases.check {
	image_index = global.answers[skin-1] - 16;
} else {
	image_index = 0;
}