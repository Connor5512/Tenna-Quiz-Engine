/**
 * @function draw_text_shadow
 * @description With this function you can draw any string at any position within the room (for drawing numbers you should use the string() function to convert them into text). The string will also be drawn with shadow, which has a configurable offset and color.
 * @param {Real} x The x coordinate of the drawn string.
 * @param {Real} y The y coordinate of the drawn string.
 * @param {String} string The string to draw.
 * @param {Constant.Color} color_main The color of the main text. It is recommended that this be a different color from color_shadow.
 * @param {Constant.Color} color_shadow The color of the text shadow. It is recommended that this be a different color from color_main.
 * @param {Real} offset The offset in pixels from the text shadow to the main text. A positive value will draw the shadow diagonally down to the right. 
*/

function draw_text_shadow(x, y, string, color_main = c_white, color_shadow = c_black, offset = 1) {
	draw_set_color(color_shadow);
	draw_text(x + offset, y + offset, string);
	draw_set_color(color_main);
	draw_text(x, y, string);
}