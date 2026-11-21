bank_name = "Untitled Quiz";
__author = "Nobody";

questions = [
	{
		option1 : "Option 1",
		option2 : "Option 2",
		option3 : "Option 3",
		option4 : "Option 4",
		
		correct : 0,
		
		text : "Question text.",
		
		decal : spr_blank,
		decal_scale : 1
	}
]

current = 0;

global.quiz_top = 32;
global.quiz_left = 64;
global.quiz_bottom = 159;
global.quiz_right = 255;

global.quiz_height = global.quiz_bottom-global.quiz_top;
global.quiz_width = global.quiz_right-global.quiz_left;