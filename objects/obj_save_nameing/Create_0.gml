image_index = 0;
prompt = "PLAYER #'S NAME?"
typedName = "";
newLetter = "";
instance_create_depth(103, 195, depth, obj_soul_blurred);
max_letters = 3;

enum name_letters {
	A,
	B,
	C,
	D,
	E,
	F,
	G,
	H,
	I,
	J,
	K,
	L,
	M,
	N,
	O,
	P,
	Q,
	R,
	S,
	T,
	U,
	V,
	W,
	X,
	Y,
	Z,
	BACK,
	END
}

function add_letter_from_index(index) {
	if (index >= name_letters.A && index <= name_letters.Z) {
		if !(string_length(typedName) == max_letters) {
			newLetter = chr(ord("A") + index);
			typedName = string_insert(newLetter, typedName, (string_length(typedName) + 1))
			//show_debug_message("Name - " + typedName);
		} else {
			debug_message(object_index, id, "Maximum name length reached!");
		}
	} else if index == name_letters.BACK {
		if string_length(typedName) >= 1 {
			typedName = string_copy(typedName, 1, (string_length(typedName) - 1));
			//show_debug_message("Name - " + typedName);
		}
	} else if index == name_letters.END {
		if (string_length(typedName) > 0) {
			audio_stop_all();
			debug_message(object_index, id, "Name confirmed.");
			ini_open("player.ini");
			ini_write_string("NICKNAMES", "P" + string(obj_nicknames.selected_player), typedName)
			instance_destroy();
			instance_destroy(obj_soul_blurred);
		}
	}
}