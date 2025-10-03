if (global.paused) {exit}
if (global.morte == 1) {exit}
if dir == 0 {

	y += vsp;

} else {

	y -= vsp;

}

if (y > 960) {

	if ativo == 1 {
	
		alarm[0] = 120
		ativo = 2
	
	}
	
}

if (y < 0) {

	if ativo == 2 {
	
		alarm[0] = 120
		ativo = 1
	
	}
	
}
