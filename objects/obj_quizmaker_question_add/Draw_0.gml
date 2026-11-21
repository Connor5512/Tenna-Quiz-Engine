draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, color, 1);
draw_text(x, y - 20, string(obj_quiz_new.current+1) + "/" + string(array_length(obj_quiz_new.questions)));