function reset_pots() {
	global.lancer_pot1 = instance_create_layer(800, 416, "Pickup", obj_board_pot);
	global.lancer_pot2 = instance_create_layer(800, 448, "Pickup", obj_board_pot);
}

reset_pots();
instance_destroy(global.lancer_pot1);
instance_destroy(global.lancer_pot2);