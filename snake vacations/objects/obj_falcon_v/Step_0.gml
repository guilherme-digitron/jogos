if (global.paused) {exit}
if (global.morte == 1) {exit}
 // movimento para baixo

if dir == 0 {

	x += vsp;

} else {

	x -= vsp;

}

if (x > 560){

	if ativo == 2 {
	
		alarm[0] = 120
		ativo = 1
	
	}
	
}


if (x < 0){

	if ativo == 1 {
	
		alarm[0] = 120
		ativo = 2
	
	}
	
}