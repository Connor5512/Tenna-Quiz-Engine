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
	ds_map_add(_map, "__author", quiz_object.__author);
	file = file_text_open_write(temp_dir + "quiz_properties.json");
	file_text_write_string(file, json_encode(_map, true));
	file_text_close(file);
	zip_add_file(zip, "quiz_properties.json", temp_dir + "quiz_properties.json");
	
	zip_save(zip, name);
	
	debug_message(object_index, id, "File saved to path " + string(name));
} else if mode == quiz_modes.import {
	var file = get_open_filename("Tenna Quiz Files (*.quiz)|*.quiz", "");
	
	if file == "" {
		debug_message(object_index, id, "File import canceled by user.");
		instance_destroy();
		exit;
	}
	
	if filename_ext(file) != ".quiz" {
		debug_message(object_index, id, "File import canceled; invalid file extension.");
		instance_destroy();
		exit;
	}
	
	var temp_dir = "temp/import/";
	directory_destroy(temp_dir);
	zip_unzip(file, temp_dir);
	
	var properties = load_json(temp_dir + "quiz_properties.json")
	
	var __author = properties.__author;
	var bank_name = properties.bank_name;
	
	
	
	var buffer = buffer_load(temp_dir + "questions.json");
	var json = buffer_read(buffer, buffer_text);
	buffer_delete(buffer);
	
	var data = json_decode(json);
	var ds_keys = ds_map_keys_to_array(data);
	//debug_message(object_index, id, ds_keys);
	
	for (var i = 0; i < array_length(ds_keys); i++) {
		var json_questions = ds_map_find_value(data, "questions");
		var reconstructed_questions = [];

		for (var j = 0; j < ds_list_size(json_questions); j++) {
			var question = ds_list_find_value(json_questions, j);
				
			array_push(reconstructed_questions, {
				text: ds_map_find_value(question, "text"),
				option1: ds_map_find_value(question, "option1"),
				option2: ds_map_find_value(question, "option2"),
				option3: ds_map_find_value(question, "option3"),
				option4: ds_map_find_value(question, "option4"),
				correct: ds_map_find_value(question, "correct"),
				decal: ds_map_find_value(question, "decal")
			});
		}

		questions = reconstructed_questions;
	}
	
	//var created_sprites = [];
	for (var i = 0; i < array_length(questions); i++) {
		var decal = questions[i].decal;
		//if !(array_contains(created_sprites, decal)) {
			var dir = temp_dir + decal;
			var img_prop = load_json(filename_change_ext(dir, ".json"));
			
			questions[i].decal = sprite_add(dir, 0, false, false, img_prop.xoffset, img_prop.yoffset);
		//}
	}
	
	room_goto(room_quiz);
	var st = instance_create_layer(0, 0, "Instances", obj_quiz_startup);
	st.given = true;
	st.__author = __author;
	st.bank_name = bank_name;
	st.questions = questions;
} else if mode == quiz_modes.export_creator {
	var name;
	var temp_string = get_save_filename("Tenna Quiz Files (*.quiz)|*.quiz", obj_quiz_new.bank_name + ".quiz");
	
	name = temp_string;
	
	if name == "" {
		debug_message(object_index, id, "File export canceled.", log_types.warn);
		instance_destroy();
		exit;
	}

	var _map = ds_map_create();
	
	var quiz_object = obj_quiz_new;
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
			
			sprite_export(_questions[i].decal, 0, filename, _questions[i].decal_scale);
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
	ds_map_add(_map, "__author", quiz_object.__author);
	file = file_text_open_write(temp_dir + "quiz_properties.json");
	file_text_write_string(file, json_encode(_map, true));
	file_text_close(file);
	zip_add_file(zip, "quiz_properties.json", temp_dir + "quiz_properties.json");
	
	zip_save(zip, name);
	
	debug_message(object_index, id, "File saved to path " + string(name));
}

instance_destroy();
exit;