visible = (obj_menus.page == menu_pages.home);
if !(visible) {
	exit;
}

if instance_exists(obj_selectionicon) {
	image_index = obj_selectionicon.selection;
}