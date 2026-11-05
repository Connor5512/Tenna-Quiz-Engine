if !keyboard_check(vk_escape) {
	instance_destroy();
}

x = camera_get_view_x(view_camera[0]) + 4;
y = camera_get_view_y(view_camera[0]) + 4;

if alpha <= 1 {
	alpha += 0.05
}

draw_sprite_ext(spr_quitting_decal, image_index, x, y, image_xscale, image_yscale, 0, c_white, alpha)

if image_index = 5 {
	if room == room_menu || room == room_title {
		game_end();
	} else {
		room_goto(room_menu);
	}
}