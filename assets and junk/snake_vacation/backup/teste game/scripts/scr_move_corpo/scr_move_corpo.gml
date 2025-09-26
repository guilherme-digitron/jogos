function move_corpo() {

	if ds_list_size(global.position) > global.segmento {
        pos = global.position[|index];
    }
    // Atualiza a posição do objeto (segmento do corpo) com base na posição recuperada
    x = pos[0];
    y = pos[1];
}
