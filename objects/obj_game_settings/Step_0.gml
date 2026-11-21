gpu_set_tex_filter(0)
randomize();

ini_open("true_config.ini");
ini_write_real("SCREEN", "FULLSCREEN", window_get_fullscreen());
ini_write_string("LANG", "LANG", "en");
ini_close();

//fullscreen
if keyboard_check_pressed(vk_f4) {
	if window_get_fullscreen() {
		window_set_fullscreen(false)
	} else {
		window_set_fullscreen(true)
	}
}

var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

if keyboard_check_pressed(vk_escape) and !instance_exists(obj_quitting_decal) {
	instance_create_depth(view_x + 4, view_y + 4, -9999, obj_quitting_decal);
}

//window_set_size(browser_width - 4, browser_height - 4);

if keyboard_check_pressed(vk_control) {
	var i = instance_create_depth(0, 0, 0, obj_quiz_handler);
	i.mode = quiz_modes.export_creator;
}

if keyboard_check_pressed(vk_alt) {
	var i = instance_create_depth(0, 0, 0, obj_quiz_handler);
	i.mode = quiz_modes.import;
}