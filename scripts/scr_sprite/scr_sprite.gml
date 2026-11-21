function sprite_get_texturegroup(sprite) {
	var groups = texturegroup_get_names();
	
	var result = undefined;
	for (var i = 0; i < array_length(groups); i++) {
		var sprites = texturegroup_get_sprites(groups[i]);
		
		if array_contains(sprites, sprite) {
			return groups[i];
		}
	}
}

function sprite_export(ind, subimg, fname, scale = 1) {
	var w = sprite_get_width(ind) * scale;
	var h = sprite_get_height(ind) * scale;
	
	var surface = surface_create(w, h);
	
	surface_set_target(surface);
	
	var _x = sprite_get_xoffset(ind) * scale;
	var _y = sprite_get_yoffset(ind) * scale;
	draw_sprite_ext(ind, subimg, _x, _y, scale, scale, 0, c_white, 1);
	
	surface_save(surface, fname);
	
	surface_reset_target();
	
	var _map = ds_map_create();
	
	ds_map_add(_map, "xoffset", _x);
	ds_map_add(_map, "yoffset", _y);
	
	var file = file_text_open_write(filename_change_ext(fname, ".json"));
	file_text_write_string(file, json_encode(_map, true));
	file_text_close(file);
}