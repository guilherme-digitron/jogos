function curse_select() {
    var curse_max = 12; // valores possíveis: 0..6
    if (global.cont >= hard) {
        
		obj_maca.ativar = 1
		
        // Se já temos todos, não faz nada
        if (array_length(global.curse) >= curse_max + 1) {
            return;
        }

        // Cria uma lista temporária com os valores que ainda não foram escolhidos
        var available = [];
        for (var i = 0; i <= curse_max; i++) {

            // Se ainda não foi escolhido, pode entrar na lista
            if (!array_contains(global.curse, i)) {
                array_push(available, i);
            }
        }

        // Sorteia 1 valor dentro dos disponíveis
        if (array_length(available) > 0) {
            new_curse = available[irandom(array_length(available) - 1)];
            array_push(global.curse, new_curse);
            hard += dificuldade;
        }
    }
}
