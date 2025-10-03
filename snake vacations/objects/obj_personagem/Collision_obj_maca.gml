var sfx = audio_play_sound(Collect_Point, 1, false);
audio_sound_gain(sfx,global.volume/global.sfx_volume, 0);
if global.historia == 1 {
	global.cont += 10
}
