function crecer(){

	global.segmento += 5
	ncorpos += 1
	novo_corpo = instance_create_layer(1, 1, "Instances", obj_corpo);
	novo_corpo.color_timer += 20
	global.pontos += 5
	global.ti = novo_corpo.index

}