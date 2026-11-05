bank_name = "Quiz Template";

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
		option1 : "Correct",
		option2 : "Correct",
		option3 : "Incorrect",
		option4 : "Incorrect",
		
		correct : 12,
		
		text : "Question 1 Text.",
		
		decal : spr_blank
	},
	{
		option1 : "Incorrect",
		option2 : "Incorrect",
		option3 : "Correct",
		option4 : "Correct",
		
		correct : 34,
		
		text : "Question 2 Text.",
		
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