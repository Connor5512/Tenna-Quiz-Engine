instance_create_layer(24, 36, "Instances", obj_selectionicon);
susie_x = 0;
kris_x = 0;
ralsei_x = 0;
icon_y = 0;

enum menu_pages {
	home,
	options
}

page = menu_pages.home;

quizes = array_length(global.quizes);