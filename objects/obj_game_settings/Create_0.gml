HUD_wait = false;
init_quizes();

ini_open("true_config.ini");
window_set_fullscreen(ini_read_real("SCREEN", "FULLSCREEN", false));

global.start_time = string(current_year) + "-" + string(current_month) + "-" + string(current_day) + " " + string(current_hour) + "-" + string(current_minute) + "-" + string(current_second)
global.log_file = "logs/" + string_replace(string(global.start_time), ".", "") + ".log"