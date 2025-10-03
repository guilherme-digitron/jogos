randomize()
record_load()
array_sort(global.curse, true)
curse_select()

switch (new_curse) {
    case 0:
        if (create_time == 0) {
            var time_curse = instance_create_layer(global.roomw/2 - 96, global.roomh/2 - 382, "Instances", obj_timer);
            create_time = 1;
        }
    break;

    case 1:
        if (create_poison == 0) {
            var maca_curse = instance_create_layer(0, 0, "Instances", obj_maca_poison);
            create_poison = 1;
        }
    break;

    case 2:
        if (create_growth == 0) {
            create_growth = 1;
        }
    break;

    case 3:
        if (create_laser == 0) {
			 var laser = instance_create_layer(0, 0, "Instances", obj_create_laser);
            create_laser = 1;
        }
    break;
	
	case 4:
        if (create_spikes == 0) {
            var spike = instance_create_layer(0, 0, "Instances", obj_spikes);
            create_spikes = 1;
        }
    break;
	
		
	case 5:
        if (create_falcon_v == 0) {
            var falconh = instance_create_layer(0, 0, "Instances", obj_falcon_v);
            create_falcon_v = 1;
        }
    break;
	
	case 6:
        if (create_falcon_h == 0) {
            var falconv = instance_create_layer(0, 0, "Instances", obj_falcon_h);
            create_falcon_h = 1;
        }
    break;
	
	case 7:
        if (create_poison_2 == 0) {
            var poison2 = instance_create_layer(0, 0, "Instances", obj_maca_poison_2);
            create_poison_2 = 1;
        }
    break;
	
	case 8:
        if (create_hall == 0) {
            var hall = instance_create_layer(0, 0, "Instances", obj_hall);
            create_hall = 1;
        }
    break;
	
	case 9:
        if (create_frog == 0) {
            var frog = instance_create_layer(0, 0, "Instances", obj_frog);
            create_frog = 1;
        }
    break;
	
	case 10:
        if (create_block == 0) {
            var block1 = instance_create_layer(0, 0, "Instances", obj_block_curse);
			var block2 = instance_create_layer(0, 0, "Instances", obj_block_curse);
			var block3 = instance_create_layer(0, 0, "Instances", obj_block_curse);
            create_block = 1;
        }
    break;
	
	case 11:
        if (create_gay == 0) {
            
            create_gay = 1;
        }
    break;
	
	case 12:
        if (create_heath == 0) {
            var apple_heath = instance_create_layer(0, 0, "Instances", obj_maca_cura);
            create_heath = 1;
        }
    break;
	
}

//-------spikes multiplicar
if create_spikes == 1 {
	while multi_spikes < global.nivel {
	    var spike = instance_create_layer(0, 0, "Instances", obj_spikes);
		multi_spikes += 1
	}
}


//-------life morte
if global.life == 0 or keyboard_check_pressed(vk_enter) {
	record_save(global.cont)
    global.morte = 1
	room_goto(ROOM_MORTE)
}


// --- Lista dos objetos que causam dano (exceto laser) ---
var perigos = [
    obj_spikes,
    obj_hall,
    obj_frog,
    obj_falcon_h,
    obj_falcon_v,
    obj_maca_poison_2
];

// --- Só checa se não estiver imortal ---
if (global.imortal <= 0) {
    var tomou_dano = false;

    // 1️⃣ Checa perigos normais
    for (var i = 0; i < array_length(perigos); i++) {
        with (perigos[i]) {
            if (id.object_index == obj_spikes && image_index != 1) continue;
            if (place_meeting(x, y, obj_personagem) || place_meeting(x, y, obj_corpo)) {
				global.life -= 1;
                global.imortal = 60;
                tomou_dano = true;
                break;
            }
        }
        if (tomou_dano) break;
    }

    // 2️⃣ Checa lasers
    with (obj_laser) {
        if (place_meeting(x, y, obj_personagem) ||
            place_meeting(x, y, obj_corpo)) {
            global.life -= 1;
            global.imortal = 60;
            tomou_dano = true;
        }
    }
}

// --- Atualiza imortalidade + piscar ---
if (global.imortal > 0) {
    global.imortal -= 1;
    var pisca = (global.imortal mod 4 < 2) ? 0 : 1;

    if (instance_exists(obj_personagem)) with (obj_personagem) image_alpha = pisca;
    with (obj_corpo) image_alpha = pisca;
} else {
    if (instance_exists(obj_personagem)) with (obj_personagem) image_alpha = 1;
    with (obj_corpo) image_alpha = 1;
}


if global.cont >= 1000 {

	room_goto(ROOM_GAME_END)

}

// gambiara

if global.life < active_sfx {

	var sfx = audio_play_sound(Life_Lose, 1, false);
	audio_sound_gain(sfx, global.sfx_volume, 0);
	active_sfx = global.life

}