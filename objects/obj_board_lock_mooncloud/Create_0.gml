function door_mooncloud_get_open() {
	return global.inventory[0].count == 3 && global.inventory[2].count == 1;
}