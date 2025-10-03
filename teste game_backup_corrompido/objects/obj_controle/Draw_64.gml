draw_self(); 
// Desenha o sprite normal do objeto (cobra ou segmento), mantendo o comportamento visual padrão

draw_set_color(c_white);
draw_set_font(-1)
// Define a cor do texto que será desenhado como branco (útil se o fundo for escuro)
//draw_text(global.roomw/2, global.roomh/2 - 320, "VIDA: " + string(global.life));
if keyboard_check(vk_control) {
    // Se a tecla Ctrl estiver sendo pressionada...

    draw_text(40, 300, "pos maca: " + string(obj_maca.x) + " " + string(obj_maca.y));
	draw_text(40, 340, "pos cabeca: " + string(obj_personagem.pos[0]) + "," + string(obj_personagem.pos[1]));
	draw_text(40, 380, "nivel " + string(global.nivel))
	draw_text(40, 420, "spikes " + string(create_spikes))
	draw_text(40, 460, "dev y " + string(obj_dev.y))
   
}