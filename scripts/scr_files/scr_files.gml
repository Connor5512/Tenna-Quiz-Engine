function load_json(json_path) {
	var buffer = buffer_load(json_path);
	var json = buffer_read(buffer, buffer_text);
	
	return json_parse(json);
}