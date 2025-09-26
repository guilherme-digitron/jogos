function angulo_corpo(){

	if ds_list_size(global.position) > global.segmento {
        
		pos_ant = global.position[|global.segmento - 1]
	}

	if is_array(pos) && is_array(pos_ant) {
	if pos_ant[0] > pos[0]{image_angle = 90}
	if pos_ant[1] > pos[1]{image_angle = 0}
	if pos_ant[0] < pos[0]{image_angle = 270}
	if pos_ant[1] < pos[1]{image_angle = 180}
	}

}