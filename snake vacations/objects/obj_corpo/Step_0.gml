if obj_controle.create_gay{gay()}
if (global.paused) {exit}
if (global.morte == 1) {exit}
move_corpo(); // funcao de movimento do corpo
angulo_corpo();