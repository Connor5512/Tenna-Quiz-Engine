function init_quizes() {
	global.quizes = [ //add your quiz object into this array
		{
			path: working_directory + "vanilla-questions.quiz",
			bank_name: "Vanilla Questions",
			__author: "Toby Fox",
			questions: 15
		}
	]
	
	if file_exists("imported_quizes.json") {
		var buffer = buffer_load("imported_quizes.json");
		var json = buffer_read(buffer, buffer_text);
		buffer_delete(buffer);
	
		var data = json_decode(json);
		var ds_keys = ds_map_keys_to_array(data);
		//debug_message(object_index, id, ds_keys);
	
		for (var i = 0; i < array_length(ds_keys); i++) {
			var key = "quiz" + string(i+1);
			var quiz = ds_map_find_value(data, key);
				
			array_push(global.quizes,
				{
					path: ds_map_find_value(quiz, "path"),
					bank_name: ds_map_find_value(quiz, "bank_name"),
					__author: ds_map_find_value(quiz, "__author"),
					questions: ds_map_find_value(quiz, "questions"),
				}
			);
			
			show_debug_message(global.quizes[i+1]);
		}
	}
}