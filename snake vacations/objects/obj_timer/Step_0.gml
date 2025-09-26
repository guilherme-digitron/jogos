if (global.paused) {exit}
if (global.morte == 1) {exit}
// Evento Step do obj_timer
if obj_controle.create_time == 1 {

	contagem_timer_curse()

}

if time_death <= 0 {

	global.life -= 1
	time_death = 60

}