var efeito = instance_create_layer(x, y - 8, "Instances", msg_vida);	
explode_particles(x, y, 20)
var sfx = audio_play_sound(Life_Gain, 1, false);
audio_sound_gain(sfx, global.sfx_volume, 0);
pos_random(false)
heath()