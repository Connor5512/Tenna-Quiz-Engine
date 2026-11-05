answers = [];
current_results = -1;
shown_answers = 0;

timer = 30;

state = results_states.tallying;

enum results_states {
	init,
	tallying,
	calculating,
	scored
}

audio = play_sound(snd_nosound);
drumroll_started = false;

_score = "";
correct_answers = 0;
quiz = noone;

obj_quiz_podium.visible = false;
obj_quiz_viginette.visible = false;
if instance_exists(obj_tenna) {
	obj_tenna.visible = false;
}