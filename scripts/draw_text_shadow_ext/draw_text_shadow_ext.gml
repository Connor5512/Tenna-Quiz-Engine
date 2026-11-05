/**
* @function draw_text_shadow_ext
* @description This function will draw text in a similar way to draw_text_shadow() only now you can set the space between each line of text - should the text occupy more than one line - and limit the width (in pixels) of the string per line so that should any line exceed this value, GameMaker will automatically split the text to the next line at the nearest available white-space (if the text has no white-spaces then it will overrun this maximum width value).
* @param {Real} x The x coordinate of the drawn string.
* @param {Real} y The y coordinate of the drawn string.
* @param {String} string The string to draw.
* @param {Real} sep The distance in pixels between lines of text.
* @param {Real} w The maximum width in pixels of the string before a line break.
* @param {Constant.Color} color_main The color of the main text. It is recommended that this be a different color from color_shadow.
* @param {Constant.Color} color_shadow The color of the text shadow. It is recommended that this be a different color from color_main.
* @param {Real} offset The offset in pixels from the text shadow to the main text. A positive value will draw the shadow diagonally down to the right. 
*/

function draw_text_shadow_ext(x, y, string, sep, w, color_main = c_white, color_shadow = c_black, offset = 1){
	draw_set_color(color_shadow);
	draw_text_ext(x + offset, y + offset, string, sep, w);
	draw_set_color(color_main);
	draw_text_ext(x, y, string, sep, w);
}