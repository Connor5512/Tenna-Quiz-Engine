/**
* @function is_multiple
* @description Checks whether a value is a multiple of another value.
* @param {Real} n1 The value to be checked for being a multiple.
* @param {Real} n2 The value to check for multiples of.
* @returns {bool} The clamped value.
*/

function is_multiple(n1, n2) {
    return n1 mod n2 == 0;
}