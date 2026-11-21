audio_stop_all();
audio = play_sound(snd_quiz);

startup = obj_quiz1;

global.quiz_phase = quiz_phases.init;

given = false;

__author = "";
bank_name = "";
questions = {};

enum quiz_phases {
	init,
	answer,
	check,
	results
}

global.quiz_top = 32;
global.quiz_left = 64;
global.quiz_bottom = 159;
global.quiz_right = 255;

global.quiz_height = global.quiz_bottom-global.quiz_top;
global.quiz_width = global.quiz_right-global.quiz_left;