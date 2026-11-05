image_xscale = 1;
image_yscale = image_xscale;

sound_played = false;
selection = 0;
quiz_x = 104;
quiz_1 = 0;
quiz_2 = 0;
quiz_3 = 0;
quiz_4 = 0;
quiz_object = noone;
answers = [ -1, -1, -1 ];
correct_answers = [	-1, -1, -1 ];
_x = [ -10, -10, -10 ]
_y = [ -10, -10, -10 ]

timer = 0;
advance = false;
snd_played = false;
draw_alpha = 1;
answer_added = false;

character = player_skins.kris;

enum player_skins {
	kris,
	susie,
	ralsei
}