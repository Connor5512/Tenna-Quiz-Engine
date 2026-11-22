just_changed = true;

max_amplitude = 320;
wave_amplitude = max_amplitude;
wave_frequency = 0.1;
wave_speed = 0.1;
wave_timer = 0;

logo_surface = -1;

logo_alpha = 0;           // Start fully transparent
fade_in_speed = 0.007;     // Adjust as needed

audio = audio_play_sound(AUDIO_BROOKIE, 10, false);

pause_timer = 0;

fade_speed_set = false;
fade_speed = 0;