if global.inventory[2].count == 1 {
	visible = true;
} else {
	visible = false;
}

if door_mooncloud_get_open() {
	instance_destroy();
}