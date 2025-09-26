function verificar_curse(numero){

	var active = -1
	
	for (var i = 0; i < array_length(global.curse); i++) {
	    if (global.curse[i] == numero) {
	        return numero;
	    }
	}
}