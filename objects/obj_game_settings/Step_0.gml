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

//if keyboard_check_pressed(vk_control) {
//	var i = instance_create_depth(0, 0, 0, obj_quiz_handler);
//	i.mode = quiz_modes.export_creator;
//}

//if keyboard_check_pressed(vk_alt) {
//	var i = instance_create_depth(0, 0, 0, obj_quiz_handler);
//	i.mode = quiz_modes.import;
//}

var _map = ds_map_create();
for (var i = 1; i < array_length(global.quizes); i++) {
	ds_map_add(_map, "quiz" + string(i), global.quizes[i]);
}
file = file_text_open_write("imported_quizes.json");
file_text_write_string(file, json_encode(_map, true));
file_text_close(file);
ds_map_destroy(_map);