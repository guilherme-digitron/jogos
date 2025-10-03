function pos_random(ignore_self = true) {
    var pos_x, pos_y;
    var achou = false;
    var tentativas = 0;

    while (!achou && tentativas < 300) {

        pos_x = irandom_range(28, 511 - sprite_width);
        pos_y = irandom_range(229, 765 - sprite_height);

        var colisao = false;

        // Lista de objetos a verificar
        var objetos = [obj_corpo, obj_block, obj_block_curse, obj_frog, obj_hall, obj_maca_poison, obj_maca_poison_2, obj_spikes];

        // Checa colisão com todos os objetos
        for (var i = 0; i < array_length(objetos); i++) {
            if (place_meeting(pos_x, pos_y, objetos[i])) {
                colisao = true;
                break;
            }
        }

        // Se não for ignorar self, checa obj_maca
        if (!ignore_self) {
            if (place_meeting(pos_x, pos_y, obj_maca)) colisao = true;
        }

        // Distância mínima para personagem
        var distancia_ok = true;
        if (instance_exists(obj_personagem)) {
            distancia_ok = (point_distance(pos_x, pos_y, obj_personagem.x, obj_personagem.y) >= 20);
        }

        if (!colisao && distancia_ok) achou = true;
        tentativas++;
    }

    if (achou) {
        x = pos_x;
        y = pos_y;
    }
}
