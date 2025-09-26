function move() {
	
	// Verifica se a tecla ESQUERDA foi pressionada e se a direção atual não é a OPOSTA (DIREITA)
	if keyboard_check_pressed(vk_left) and global.active_direction != 2 {
		mov_h = -1; // Define movimento horizontal para a esquerda
		image_angle = 90
		global.active_direction = 1; // Atualiza a direção ativa para ESQUERDA
	} 
	
	// Verifica se a tecla DIREITA foi pressionada e se a direção atual não é a OPOSTA (ESQUERDA)
	else if keyboard_check_pressed(vk_right) and global.active_direction != 1 {
		mov_h = 1; // Define movimento horizontal para a direita
		image_angle = 270
		global.active_direction = 2; // Atualiza a direção ativa para DIREITA
	} 
	
	// Verifica se a tecla BAIXO foi pressionada e se a direção atual não é a OPOSTA (CIMA)
	else if keyboard_check_pressed(vk_down) and global.active_direction != 4 {
		mov_v = 1; // Define movimento vertical para baixo
		image_angle = 180
		global.active_direction = 3; // Atualiza a direção ativa para BAIXO
	} 
	
	// Verifica se a tecla CIMA foi pressionada e se a direção atual não é a OPOSTA (BAIXO)
	else if keyboard_check_pressed(vk_up) and global.active_direction != 3 {
		mov_v = -1; // Define movimento vertical para cima
		image_angle = 0
		global.active_direction = 4; // Atualiza a direção ativa para CIMA
	} 

	// Calcula a velocidade horizontal com base na direção e na velocidade
	hsp = mov_h * spd;

	// Verifica colisão horizontal com o objeto obj_block

	// Atualiza a posição horizontal apenas se estiver indo para esquerda (1) ou direita (2)
	if global.active_direction == 1 or global.active_direction == 2 {
		pos[0] += hsp; // Atualiza coordenada X da posição
	}

	// Calcula a velocidade vertical com base na direção e na velocidade
	vsp = mov_v * spd;

	// Atualiza a posição vertical apenas se estiver indo para baixo (3) ou cima (4)
	if global.active_direction == 3 or global.active_direction == 4 {
		pos[1] += vsp; // Atualiza coordenada Y da posição
	}
}
