var drawn_decal = decal;

draw_sprite_ext(spr_decal_blank, 0, decal_x, decal_y, 1, 1, 0, color, 1);
draw_sprite_ext(drawn_decal, 0, decal_x, decal_y, obj_quiz_new.questions[obj_quiz_new.current].decal_scale, obj_quiz_new.questions[obj_quiz_new.current].decal_scale, 0, c_white, 1);
