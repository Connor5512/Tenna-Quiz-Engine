/// @function                   string_append
/// @param  {string}    _string    The string to append text to
/// @param  {any}      string_or_format   The text to append onto the given string
/// @description        Attatch a given format or string to the end of a text string
function string_append(_string, val_or_format) {
	return _string + string(val_or_format);
}

/// @function                   string_prepend
/// @param  {string}    _string    The string to preped text to
/// @param  {any}      string_or_format   The text to append onto the given string
/// @description        Attatch a given format or string to the beginning of a text string
function string_prepend(_string, val_or_format) {
	return string(val_or_format) + _string;
}

/// @function                   string_wrap
/// @param  {string}    _text    The text to wrap
/// @param  {real}      _width   The maximum width of the text before a line break is inserted
/// @description        Take a string and add line breaks so that it doesn't overflow the maximum width

function string_wrap(_text, _width) {
	var _text_wrapped = "";
	var _space = -1;
	var _char_pos = 1;
	var bulleted = false;
	if string_char_at(_text, 1) == "*" {
		bulleted = true;
	}
	while (string_length(_text) >= _char_pos) {
		if (string_width(string_copy(_text, 1, _char_pos)) > _width) {
			if (_space != -1) {
				if bulleted {
					_text_wrapped += string_copy(_text, 1, _space) + "\n  ";
				} else {
					_text_wrapped += string_copy(_text, 1, _space) + "\n";
				}
				_text = string_copy(_text, _space + 1, string_length(_text) - (_space));
				_char_pos = 1;
				_space = -1;
			}
		}
		if (string_char_at(_text,_char_pos) == " ") {
			_space = _char_pos;
		}
		_char_pos += 1;
	}
	if (string_length(_text) > 0) {
		_text_wrapped += _text;
	}
	return _text_wrapped;
}

function string_numbers(_string) {
	new_string = "";
	var digits = ["0","1","2","3","4","5","6","7","8","9"];
	
	for (var i = 0; i < string_length(_string); i++) {
		var char = string_char_at(_string, i+1);
		if (array_contains(digits, char)) {
			new_string = string_append(new_string, char);
		}
	}
	
	return new_string;
}

function string_contains(str, substr) {
	return string_replace_all(str, substr, "") != str;
}