image_xscale = 2;
image_yscale = image_xscale;

instance_create_depth(0, 0, -9998, obj_txtb);
obj_txtb.text[0] = "HO HO HO! L MARKS THE SPOT!";
obj_txtb.text[1] = "I'LL DIG UP A TREASURE FOR YOU!";
pauses = 0;

snd = audio_play_sound(snd_nosound, 10, false);
sprite_index = spr_lancer_board;
image_index = 0;
image_speed = 0;