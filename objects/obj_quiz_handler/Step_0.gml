if mode == quiz_modes.export {
	var name;
	var temp_string = get_save_filename("Tenna Quiz Files (*.quiz)|*.quiz", "");
	
	name = temp_string;
	
	if name == "" {
		debug_message(object_index, id, "File export canceled.", log_types.warn);
		instance_destroy();
		exit;
	}

	var _map = ds_map_create();
	
	var quiz_object = obj_quiz1;
	var _questions = variable_clone(quiz_object.questions);
	
	
	var temp_dir = "temp/export/";
	directory_destroy(temp_dir);
	var zip = zip_create();
	
	var decals = [];
	for (var i = 0; i < array_length(_questions); i++) {
		var path = "sprites/" + sprite_get_name(_questions[i].decal) + ".png"
		var filename = temp_dir + path;
		
		if !(array_contains(decals, _questions[i].decal)) {
			array_push(decals, _questions[i].decal);
			debug_message(object_index, id, _questions[i].decal);
			
			sprite_export(_questions[i].decal, 0, filename);
			zip_add_file(zip, path, filename);
			zip_add_file(zip, filename_change_ext(path, ".json"), filename_change_ext(filename, ".json"));
		}
		
		_questions[i].decal = path;
	}
	
	ds_map_add(_map, "questions", _questions);
	var file = file_text_open_write(temp_dir + "questions.json");
	file_text_write_string(file, json_encode(_map, true));
	file_text_close(file);
	zip_add_file(zip, "questions.json", temp_dir + "questions.json");
	
	ds_map_destroy(_map);
	
	_map = ds_map_create();
	ds_map_add(_map, "bank_name", quiz_object.bank_name);
	ds_map_add(_map, "author", quiz_object.author);
	file = file_text_open_write(temp_dir + "quiz_properties.json");
	file_text_write_string(file, json_encode(_map, true));
	file_text_close(file);
	zip_add_file(zip, "quiz_properties.json", temp_dir + "quiz_properties.json");
	
	zip_save(zip, name);
	
	debug_message(object_index, id, "File saved to path " + string(name));
}

instance_destroy();
exit;