bank_name = "Untitled Quiz";
__author = "";

draw_set_halign(fa_left);
draw_set_valign(fa_top);
if room == room_quiz {
	innit_options();
	var t = instance_create_depth(0, 0, 10, obj_quiz_timer);
	t.quiz = id;
}
setup = false;

questions = [
	{
		option1 : "Option 1",
		option2 : "Option 2",
		option3 : "Option 3",
		option4 : "Option 4",
		
		correct : 0,
		
		text : "Question text.",
		
		decal : spr_blank
	}
]

current = 0;
player1_answers = [];
player2_answers = [];
player3_answers = [];
correct_answers = [];

decal = spr_blank;

global.quiz_phase = quiz_phases.answer;

start_results = false;
current_results = -1;