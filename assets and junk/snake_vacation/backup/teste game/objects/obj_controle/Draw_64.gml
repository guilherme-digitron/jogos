draw_self(); 
// Desenha o sprite normal do objeto (cobra ou segmento), mantendo o comportamento visual padrão

draw_set_color(c_black);
draw_set_font(-1)
// Define a cor do texto que será desenhado como branco (útil se o fundo for escuro)

if keyboard_check(vk_control) {
    // Se a tecla Ctrl estiver sendo pressionada...

    draw_text(40, 40, "elementos da lista: " + string(ds_list_size(global.position)));
    draw_text(40, 60, "pos cabeca: " + string(obj_personagem.pos[0]) + "," + string(obj_personagem.pos[1]));
    draw_text(40, 80, "segmento: " + string(global.segmento));
	draw_text(40, 100, "pontos: " + string(global.pontos));
	draw_text(40, 120, "novo corpo index: " + string(global.ti));
	draw_text(40, 140, "cont: " + string(global.cont));	
	draw_text(40, 160, "time: " + string(obj_personagem.time));
	draw_text(40, 180, "curse_table: " + string(global.curse));
	draw_text(40, 200, "hard: " + string(hard));
	//curses
	draw_text(250, 100, "curse_ativa: " + string(global.active));
	draw_text(250, 60, "create_poison: " + string(create_poison));
	draw_text(250, 40, "create_time: " + string(create_time));
	draw_text(250, 80, "create_growth: " + string(create_growth));
	draw_text(250, 120, "new_curse: " + string(new_curse));
  
}
