if ativar == 1
{
	
	var efeito = instance_create_layer(x, y - 8, "Instances", msg_nivel)
	global.nivel += 1
	ativar = 0
	
} else {

	var efeito = instance_create_layer(x, y - 8, "Instances", msg_pontuacao)

}
explode_particles(x, y, 20)
pos_random(true)