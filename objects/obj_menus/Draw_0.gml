draw_set_font(fnt_8bit);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_yellow);
if page == menu_pages.home {
	var start = 30;
	var gap = 14;
	var _x = 36;
	for (var i = 0; i < quizes; i++) {
		draw_text(_x, start + i*gap, global.quizes[i].bank_name);
	}
	draw_text(_x, start + quizes*gap, "IMPORT FILE");
	draw_text(_x, start + (quizes+1)*gap, "QUIZ MAKER");
	draw_text(_x, start + (quizes+2)*gap, "QUIT");
} else if page == menu_pages.options {
	draw_set_halign(fa_center);
	draw_text((room_width/2), 180, "BACK");
	draw_text((room_width/2), 40, "OPTIONS");
	var icon_spacing = 50;
	var icon_scale = 3;
	draw_sprite_ext(spr_quiz_selectionicons, 0, (room_width/2) - icon_spacing, 110, icon_scale, icon_scale, 0, c_white, 1);
	draw_sprite_ext(spr_quiz_selectionicons, 1, (room_width/2), 110, icon_scale, icon_scale, 0, c_white, 1);
	draw_sprite_ext(spr_quiz_selectionicons, 2, (room_width/2) + icon_spacing, 110, icon_scale, icon_scale, 0, c_white, 1);
	
	kris_x = (room_width/2) - icon_spacing;
	susie_x = (room_width/2);
	ralsei_x = (room_width/2) + icon_spacing;
	icon_y = 145;
}