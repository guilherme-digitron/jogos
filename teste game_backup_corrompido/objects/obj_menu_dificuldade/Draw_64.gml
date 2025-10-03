var wgui = display_get_gui_width();
var hgui = display_get_gui_height();

// Posição do seletor
var pos_x = wgui / 2;
var pos_y = hgui * 0.3;

// Fonte e alinhamento
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- Título acima do seletor ---
draw_set_color(c_white);
var _texto_titulo = "Dificuldade"; // Define o português como padrão

switch (global.language) {
    case 1: // Inglês
        _texto_titulo = "Difficulty";
        break;
        
    case 2: // Alemão
        _texto_titulo = "Schwierigkeit";
        break;
}

// 2. Usa a variável para desenhar o texto
draw_text(pos_x, pos_y - 60, _texto_titulo);

// Texto atual da dificuldade
var txt = dificuldades[dificuldade_atual];
var strw = string_width(txt);

// --- Cor arco-íris dinâmica ---
var hue = (current_time div 20) mod 360;
var cor_rainbow = make_color_hsv(hue, 240, 240);
if (!variable_global_exists("cor_atual")) global.cor_atual = cor_rainbow;
global.cor_atual = merge_color(global.cor_atual, cor_rainbow, 0.1);

// --- Desenho com efeito de onda nas letras ---
var scale = 1;
draw_set_color(global.cor_atual);

for (var i = 1; i <= string_length(txt); i++) {
    var ch = string_char_at(txt, i);
    var cw = string_width(ch);
    var offset_x = -strw/2 + string_width(string_copy(txt, 1, i-1)) + cw/2;

    // Efeito de onda → sobe/desce
    var offset_y = sin((i*0.6) + current_time/200) * 6;

    draw_text_transformed(pos_x + offset_x, pos_y + offset_y, ch, scale, scale, 0);
}

// --- Desenha setas a 20px do texto ---
draw_set_color(c_white);
draw_text(pos_x - strw/2 - 20, pos_y, "<");
draw_text(pos_x + strw/2 + 20, pos_y, ">");

// --- Interação com clique ---
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Área da seta esquerda "<"
if (point_in_rectangle(mx, my, pos_x - strw/2 - 40, pos_y - 20, pos_x - strw/2, pos_y + 20)) {
    if (mouse_check_button_pressed(mb_left)) {
        dificuldade_atual--;
        if (dificuldade_atual < 0) dificuldade_atual = array_length(dificuldades) - 1;

        // Partículas no clique
        part_particles_create(part_sys, pos_x - strw/2 - 20, pos_y, part_tipo, 10);
    }
}

// Área da seta direita ">"
if (point_in_rectangle(mx, my, pos_x + strw/2, pos_y - 20, pos_x + strw/2 + 40, pos_y + 20)) {
    if (mouse_check_button_pressed(mb_left)) {
        dificuldade_atual++;
        if (dificuldade_atual >= array_length(dificuldades)) dificuldade_atual = 0;

        // Partículas no clique
        part_particles_create(part_sys, pos_x + strw/2 + 20, pos_y, part_tipo, 10);
    }
}

// Restaura cor padrão
draw_set_color(c_white)
global.dificuldade = dificuldade_atual
