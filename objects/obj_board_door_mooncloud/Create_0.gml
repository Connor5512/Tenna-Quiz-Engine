timer = 0;
pauses = 0;

function door_mooncloud_get_open() {
	return global.inventory[0].count == 3 && global.inventory[2].count == 1;
}

warp_x = 2112;
warp_y = 222;