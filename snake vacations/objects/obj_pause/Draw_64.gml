// --- Desenha a UI do Menu de Pause ---

// Pega as dimensões da GUI para centralizar
var _view_w = display_get_gui_width();
var _view_h = display_get_gui_height();
var _center_x = _view_w / 2;
var _center_y = _view_h / 2;

// Fundo escurecido
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(0, 0, _view_w, _view_h, false);
draw_set_alpha(1);

// Configurações da fonte
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 1. Desenha a frase com margem e quebra de linha
var _text_max_width = _view_w - (margin * 2); // Largura máxima do texto
draw_set_color(c_white);
draw_text_ext(
    _center_x, 
    _center_y - 150, 
    current_phrase, 
    string_height(current_phrase) + 5, // Espaçamento entre linhas
    _text_max_width // Largura máxima
);

// 2. Desenha os botões
var _continue_y = _center_y + 40;
var _main_menu_y = _center_y + 110;

// Botão "Continuar"
var _color_continue = (hover_option == 0) ? c_yellow : c_white;
draw_set_color(_color_continue);
draw_text_transformed(_center_x, _continue_y, continue_button_text, button_scale[0], button_scale[0], 0);

// Botão "Menu Inicial"
var _color_main_menu = (hover_option == 1) ? c_yellow : c_white;
draw_set_color(_color_main_menu);
draw_text_transformed(_center_x, _main_menu_y, main_menu_button_text, button_scale[1], button_scale[1], 0);

// Reseta as configurações de desenho
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);