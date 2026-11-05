function deltarune_import_save(){
	var savePath = get_open_filename("", "Select your Chapter 3 save from the Deltarune game files.");
	if savePath != "" {
		var file = file_text_open_read(savePath);
		var line_num = 0;

		while (!file_text_eof(file)) {
			line_num += 1;
			var line = file_text_readln(file);

			if (line_num == 2) global.vesselName = string(line);
			else if (line_num == 1217) global.vesselHead = line;
			else if (line_num == 1218) global.vesselBody = line;
			else if (line_num == 1219) global.vesselLegs = line;
			else if (line_num == 1222) {
				global.vesselSoul = line;
				break; // we’re done reading
			}
		}
	}
}