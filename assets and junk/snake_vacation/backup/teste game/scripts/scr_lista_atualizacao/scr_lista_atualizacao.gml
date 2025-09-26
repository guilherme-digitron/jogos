function atualiacao_lista() {
	
	// Adiciona a posição atual (x, y) da cabeça da cobra no final da lista global de posições
	ds_list_add(global.position, [x, y]);

	// Se houver elementos na lista, atualiza a variável pos com a primeira posição
	if ds_list_size(global.position) > 0 {
		pos = global.position[|0]; // Acessa o primeiro elemento da lista (início da "fila")
	}

	// Se a lista exceder o tamanho máximo permitido (baseado em tamanho da cobra e atraso), remove o segundo item da lista
	if ds_list_size(global.position) > global.pontos {
		ds_list_delete(global.position, 1); // Remove o segundo elemento (não o primeiro!)
	}
}
