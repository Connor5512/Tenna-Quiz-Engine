/*	

This is my new Tenna Quiz Engine!

I've marked a folder in the Asset Browser called "Quizes" for you to look through.
In there contains four things:
	UI folder
	obj_quiz1
	obj_quiz2
	scr_quiz_init
	
You only have to worry about obj_quiz2 and scr_quiz_init.
	
obj_quiz2 is a template quiz for you to duplicate and make your own.
	The customization is all in the Create event.
		bank_name is simply the title of your question bank.
		The questions[] array contains the data for your questions.
			Yes, you have to specify a decal even if you don't want one displayed. Just put "spr_blank."
			The "correct" field is the digits of the correct options.
				"13" would allow options 1 and 3.
				"4" would only allow option 4.
				"1234" would allow options 1, 2, 3, and 4.
scr_quiz_init is just to initialize your custom quiz in the menu.
	Add the name of your new object (not the bank_name variable) into the global.quizes array.
	The engine handles everything else from that point on.

*/