atualiacao_lista(); // Atualiza a lista global com a nova posição da cabeça e remove posições antigas conforme necessário
move();       // Move a cabeça da cobra (define hsp e vsp, detecta colisões, atualiza posição)
morte_cobra();

x = pos[0];   // Define a posição x da cabeça com base na variável pos, que vem da lista de posições
y = pos[1];   // Define a posição y da cabeça com base na variável pos

image_angle = global.angulo

if instance_exists(obj_timer){
	if obj_timer.time_death <= 0 {

		morte_cobra()

	}	
}

