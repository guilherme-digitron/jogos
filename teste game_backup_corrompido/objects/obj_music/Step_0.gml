var volume = 0.07;

switch(room) {

    case ROOM_GAME:
        if (tocar != 1) {
            audio_stop_all();
            musica_atual = audio_play_sound(music_boss, 1, true);
            audio_sound_gain(musica_atual, global.master_volume, 0);
            tocar = 1;
        }
     break;	
	
    case ROOM_CREDITOS:
        if (tocar != 2) {
            audio_stop_all();
            musica_atual = audio_play_sound(music_prety, 1, true);
            audio_sound_gain(musica_atual, global.master_volume, 0);
            tocar = 2;
        }
     break;

    case ROOM_MORTE:
        if (tocar != 3) {
            audio_stop_all();
            musica_atual = audio_play_sound(Player_Died, 1, false);
            audio_sound_gain(musica_atual, global.master_volume, 0);
            tocar = 3;
        }
        break;

    case ROOM_GAME_END:
        if (tocar != 4) {
            audio_stop_all();
            musica_atual = audio_play_sound(music_prety, 1, true);
            audio_sound_gain(musica_atual, global.master_volume, 0);
            tocar = 4;
        }
        break;
}

if room == ROOM_GAME {

	if global.paused == true {
			
		audio_pause_sound(musica_atual)
			
	} else {
			
		audio_resume_sound(musica_atual)
			
	}

}