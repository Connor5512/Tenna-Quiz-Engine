x = camera_get_view_x(view_camera[0]) + 334;
y = camera_get_view_y(view_camera[0]) + 46;

image_xscale = 1.323529;
image_yscale = 2.733333;
draw_sprite_ext(spr_bar, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);

if global.inventory[0].count > 0 { //KEY
	draw_sprite(spr_board_key, 0, x + 11, y - 32);
	draw_sprite(spr_board_inventory_count, global.inventory[0].count, x + 27, y - 21);
}

if global.inventory[1].count > 0 { //LANCER
	draw_sprite(spr_lancer_board, 0, x + 11, y - 14);
	draw_sprite(spr_board_inventory_count, global.inventory[1].count, x + 27, y - 3);
}

if global.inventory[2].count > 0 { //mooncloud
	draw_sprite(spr_board_mooncloud, 0, x + 11, y + 4);
	draw_sprite(spr_board_inventory_count, global.inventory[2].count, x + 27, y + 15);
}