HUD_wait = false;
init_quizes();

ini_open("true_config.ini");
window_set_fullscreen(ini_read_real("SCREEN", "FULLSCREEN", false));