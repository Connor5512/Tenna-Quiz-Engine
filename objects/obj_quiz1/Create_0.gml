bank_name = "Vanilla Questions";
__author = "Toby Fox";

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
		option1 : "TV Thirty!",
		option2 : "TV TIME!!!",
		option3 : "Past midnight",
		option4 : "Thursday",
		
		correct : 123,
		
		text : "What time is it right now?",
		
		decal : spr_blank
	},
	{
		option1 : "Higher",
		option2 : "Lower",
		option3 : "Priceless",
		option4 : "$32.00 MSRP",
		
		correct : 14,
		
		text : "Brand A values this Ralsei at $8! What's the true value!?",
		
		decal : spr_quiz_ralsei_plush
	},
	{
		option1 : "Chocolate",
		option2 : "Pie",
		option3 : "Salsa",
		option4 : "Jam",
		
		correct : 2,
		
		text : "What's Kris's favorite food?",
		
		decal : spr_blank
	},
	{
		option1 : "Mr. TV Guy",
		option2 : "Mr. Lil' Nose",
		option3 : "Mr. Tenna",
		option4 : "Mr. Email",
		
		correct : 3,
		
		text : "What is the name of this show's host?",
		
		decal : spr_blank
	},
	{
		option1 : "Don't Touch That Dial!",
		option2 : "Marvelous Mystery Board",
		option3 : "Magical Mystery Board",
		option4 : "Don't Lick the Screen!",
		
		correct : 2,
		
		text : "What is the highly memorable heading of \"TV Time?\"",
		
		decal : spr_blank
	},
	{
		option1 : "Lancer",
		option2 : "Dancer",
		option3 : "Prancer",
		option4 : "Mr. Generosity",
		
		correct : 0, //unfortunately, I don't know how to implement a "majority rules" mode without extra code...
		
		text : "What's this kid's name? Seriously I don't remember.",
		
		decal : spr_lancer_dt
	},
	{
		option1 : "Head",
		option2 : "Body",
		option3 : "Legs",
		option4 : "It's accurate",
		
		correct : 4,
		
		text : "Apparently you made this awful thing. Except for... what?",
		
		decal : spr_duckmachine
	},
	{
		option1 : "Pipps",
		option2 : "Dicer",
		option3 : "Toylet",
		option4 : "Pippins",
		
		correct : 4,
		
		text : "What's the name of this awful guy?",
		
		decal : spr_npc_pippins_jump
	},
	{
		option1 : "Sword Magician",
		option2 : "Big Penguin",
		option3 : "Purple Dragon",
		option4 : "Green Lizard",
		
		correct : 1,
		
		text : "What was Asriel's favorite character in Smashing Fighters?",
		
		decal : spr_blank
	},
	{
		option1 : "Cool Rich Tenna",
		option2 : "Cathode Ray Tube",
		option3 : "Classic Real TV",
		option4 : "Cartoons",
		
		correct : 2,
		
		text : "What does \"CRT\" stand for, anyway!?",
		
		decal : spr_blank
	},
	{
		option1 : "Red",
		option2 : "White",
		option3 : "Yellow",
		option4 : "None",
		
		correct : 3,
		
		text : "Which one of these is the Composite Video cable!?",
		
		decal : spr_quiz_images
	},
	{
		option1 : "Weather channel",
		option2 : "B&W Game Shows",
		option3 : "NOIR Movie Channel",
		option4 : "None of these",
		
		correct : 1,
		
		text : "Which TV channel is the most popular!?",
		
		decal : spr_blank
	},
	{
		option1 : "Lancer",
		option2 : "Dancer",
		option3 : "Prancer",
		option4 : "Mr. Generosity",
		
		correct : 0,
		
		text : "Serously, what is this guy's name!?",
		
		decal : spr_lancer_dt
	},
	{
		option1 : "Cooking show",
		option2 : "Nasty music videos",
		option3 : "Monster movies",
		option4 : "Cowboy show",
		
		correct : 4,
		
		text : "Kris, which show was Asgore's favorite!?",
		
		decal : spr_blank
	},
	{
		option1 : "It was canceled",
		option2 : "It was canceled",
		option3 : "It was canceled",
		option4 : "It was canceled",
		
		correct : 1234,
		
		text : "Now when does Asgore's favorite cowboy puppet show air!?",
		
		decal : spr_blank
	}
];

current = 0;
player1_answers = [];
player2_answers = [];
player3_answers = [];
correct_answers = [];

decal = spr_blank;

global.quiz_phase = quiz_phases.answer;

start_results = false;
current_results = -1;