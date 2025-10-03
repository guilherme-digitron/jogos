var sfx = audio_play_sound(Collect_Point, 1, false);
audio_sound_gain(sfx, global.sfx_volume, 0);
if global.historia == 1 {
	global.cont += 10
}

if obj_controle.create_time == 1 {
		
	obj_timer.time_death += 3
	
}
