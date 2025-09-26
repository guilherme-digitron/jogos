function pos_maca(){
	
	instance_destroy();

	var pos_x, pos_y;
	var tentativa = 0;
	var max_tentativas = 100;

	do {
	    pos_x = irandom_range(0, room_width);
	    pos_y = irandom_range(0, room_height);
	    tentativa += 1;
	} until (!position_meeting(pos_x, pos_y, obj_corpo) && !position_meeting(pos_x, pos_y, obj_block)) || tentativa > max_tentativas;

	// Se achou posição válida, cria a maçã
	if (tentativa <= max_tentativas) {
	    instance_create_layer(pos_x, pos_y, "Instances", obj_maca);
	} else {
	    show_debug_message("Não foi possível encontrar posição válida para a maçã.");
	}

}