// --- CONFIGURAÇÕES DE DESENHO ---
// Define a fonte, o alinhamento e a cor
draw_set_font(Font1);
draw_set_halign(fa_center); // Alinhamento horizontal: CENTRO
draw_set_valign(fa_top);     // Alinhamento vertical: TOPO
draw_set_color(c_white);     // Cor: BRANCA

// --- DESENHA O TEXTO ---
// Define a posição X central da tela
var _x = room_width / 2;

// Percorre a lista de créditos (array) e desenha cada linha
for (var i = 0; i < array_length(credits_text); i++) {
    // Calcula a posição Y de cada linha individualmente
    var _current_y = y_pos + (i * line_height);
    
    // Desenha o texto da linha atual na posição calculada
    draw_text(_x, _current_y, credits_text[i]);
}

// --- LIMPEZA ---
// É uma boa prática resetar as configurações de desenho para não afetar outros objetos
draw_set_halign(fa_left);
draw_set_color(c_black);