// Pega o objeto que o mouse está em cima
var alvo = instance_position(mouse_x, mouse_y, all);

if (alvo != noone) {
    global.objeto_hover = alvo;
} else {
    global.objeto_hover = noone;
}
