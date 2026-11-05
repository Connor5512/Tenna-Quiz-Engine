bank_name = "Connor's Quiz";

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
		option1 : "Hit me.",
		option2 : "I'm ready!",
		option3 : "I already love this.",
		option4 : "Why did you follow through on this?",
		
		correct : 123,
		
		text : "CATEGORY 1:\nHomicide & Canibalism",
		
		decal : spr_blank
	},
	{
		option1 : "2%",
		option2 : "5%",
		option3 : "16%",
		option4 : "20%",
		
		correct : 1,
		
		text : "How much myoglobin is in human muscle?",
		
		decal : spr_blank
	},
	{
		option1 : "Chicken",
		option2 : "Pork",
		option3 : "Beef",
		option4 : "Fish",
		
		correct : 3,
		
		text : "Robbie Gonzalez in 2014 said human flesh looks like what?",
		
		decal : spr_blank
	},
	{
		option1 : "Robbie Gonzalez",
		option2 : "William Seabrook",
		option3 : "Bill Schutt",
		option4 : "Unknown; Cave Writings",
		
		correct : 2,
		
		text : "Which of these people compared human flesh to veal?",
		
		decal : spr_blank
	},
	{
		option1 : "First-Degree Murder",
		option2 : "Negligent Homicide",
		option3 : "Justifiable Homicide",
		option4 : "Voluntary Manslaughter",
		
		correct : 4,
		
		text : "A person walks in on their cheating spouce and kills them.",
		
		decal : spr_blank
	},
	{
		option1 : "First-Degree Murder",
		option2 : "Negligent Homicide",
		option3 : "Justifiable Homicide",
		option4 : "Voluntary Manslaughter",
		
		correct : 3,
		
		text : "A police officer shoots an armed suspect.",
		
		decal : spr_blank
	},
	{
		option1 : "First-Degree Murder",
		option2 : "Negligent Homicide",
		option3 : "Justifiable Homicide",
		option4 : "Voluntary Manslaughter",
		
		correct : 1,
		
		text : "Intentional murder with \"malice afterthought\".",
		
		decal : spr_blank
	},
	{
		option1 : "Hooray!",
		option2 : "Lesgooo!!",
		option3 : "Yay!!!",
		option4 : "WHY?!?!",
		
		correct : 123,
		
		text : "CATEGORY 2:\nMale/Female Reproduction",
		
		decal : spr_blank
	},
	{
		option1 : "Travel to the uterus",
		option2 : "Ripening",
		option3 : "Menustration",
		option4 : "Ovulation",
		
		correct : 4,
		
		text : "Which of these terms is menustration stage 3?",
		
		decal : spr_blank
	},
	{
		option1 : "Meiosis",
		option2 : "Mitosis",
		option3 : "Gamete",
		option4 : "Menustration",
		
		correct : 1,
		
		text : "Which term describes how sex cells are made?",
		
		decal : spr_blank
	},
	{
		option1 : "They actually can",
		option2 : "Semen needs the urethra to be cleaned first",
		option3 : "All of the above.",
		option4 : "None of the above.",
		
		correct : 2,
		
		text : "Why can't urine & semen pass through the urethra?",
		
		decal : spr_blank
	},
	{
		option1 : "PENIS",
		option2 : "Vagina",
		option3 : "Urethra",
		option4 : "Ovary",
		
		correct : 1,
		
		text : "The external male genital is called...?",
		
		decal : spr_blank
	},
	{
		option1 : "Hooray!",
		option2 : "FINALLY!!!",
		option3 : "Yay!!!",
		option4 : "At least it's not the last one again",
		
		correct : 123,
		
		text : "CATEGORY 3:\nDark Humor",
		
		decal : spr_blank
	},
	{
		option1 : "\"They hit the second tower\"",
		option2 : "Stay silent",
		option3 : "Be respectful",
		option4 : "\"9/11 was an inside job\"",
		
		correct : 14,
		
		text : "It's September 11th and you're watching a documentary.",
		
		decal : spr_blank
	},
	{
		option1 : "FLORIDAAA",
		option2 : "MANNNN",
		option3 : "IS THE BESTTTT",
		option4 : "Why was the last one so short?",
		
		correct : 123,
		
		text : "CATEGORY 3:\nFlorida Man",
		
		decal : spr_blank
	},
	{
		option1 : "May 30, 2006",
		option2 : "May 30, 2011",
		option3 : "May 30, 1998",
		option4 : "May 30, 2008",
		
		correct : 1,
		
		text : "A man drowned trying to retrieve a stalled, toy boat.",
		
		decal : spr_blank
	},
	{
		option1 : "December 11, 2025",
		option2 : "December 11, 2015",
		option3 : "December 11, 2006",
		option4 : "December 11, 2019",
		
		correct : 4,
		
		text : "Arrested after operating an aircraft without a license.",
		
		decal : spr_blank
	},
	{
		option1 : "April 28, 2001",
		option2 : "April 28, 2010",
		option3 : "April 28, 2006",
		option4 : "April 28, 2009",
		
		correct : 2,
		
		text : "Making bomb threats aboard a Delta Air Lines flight.",
		
		decal : spr_blank
	},
	{
		option1 : "shot at roommate over cat hair on couch",
		option2 : "posed as a medical nurse without a license",
		option3 : "shot 4-year-old at Christmas get-together",
		option4 : "Debra Thomas assasination with a paintbrush",
		
		correct : 1,
		
		text : "What was this man arrested for?",
		
		decal : spr_florida_man_april_28_2018
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