if !(stuck) {
	x -= g;
	g -= 0.5;
	image_speed = 1;
	if place_meeting(x, y, obj_menu_inventory) {
		instance_destroy();
		instance_destroy(inst_977CE13);
		instance_destroy(inst_FBAD2A0);
		global.inventory[1].count += 1;
		instance_create_depth(0, 0, -9998, obj_txtb);
		obj_txtb.text[0] = "HO HO HO! YOU HAVE RESCUED ME!"
		obj_txtb.text[1] = "I WILL GIVE YOU EVERYTHING I HAVE!....."
		obj_txtb.text[2] = "AND, ALL I HAVE, IS MYSELF!"
		obj_txtb.text[3] = "YOU GOT LANCER x1! IS THERE SOMETHING HE CAN DIG?"
	}
} else {
	image_speed = 0;
}