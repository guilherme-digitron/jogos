// Evento Draw do obj_opcoes

// --- CONFIGURAÇÕES DE DESENHO ---
draw_set_font(Font1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- DESENHAR AS OPÇÕES ---
var _x = room_width / 2;
var _arrow_offset = 250; // Mesma distância do Create

// Título do Menu
draw_text(_x, 100, "OPÇÕES");

// Opção de Linguagem
draw_text(_x, y_lang - 40, "IDIOMA");
draw_text(_x, y_lang, "< " + languages[global.language] + " >");

// Opção de Volume Master
draw_text(_x, y_vol_master - 40, "VOLUME GERAL");
draw_text(_x, y_vol_master, "< " + string(global.master_volume) + " >");

// Opção de Volume SFX
draw_text(_x, y_vol_sfx - 40, "VOLUME EFEITOS");
draw_text(_x, y_vol_sfx, "< " + string(global.sfx_volume) + " >");


// --- RESETAR CONFIGURAÇÕES DE DESENHO (BOA PRÁTICA) ---
draw_set_halign(fa_left)

// Botão de Sair (com efeito de escala)
draw_text_transformed(_x, y_exit, "VOLTAR", exit_scale, exit_scale, 0);

// --- RESETAR CONFIGURAÇÕES DE DESENHO (BOA PRÁTICA) ---
draw_set_halign(fa_left);