// --- 1. Define os textos traduzíveis no início do evento ---
var texto_titulo = "OPÇÕES";
var texto_voltar = "VOLTAR";

switch (global.language) {
    case 1: // English
        texto_titulo = "OPTIONS";
        texto_voltar = "BACK";
        break;
        
    case 3: // German
        texto_titulo = "OPTIONEN";
        texto_voltar = "ZURÜCK";
        break;
}

// --- 2. O resto do seu código de desenho usa essas variáveis ---

// --- CONFIGURAÇÕES DE DESENHO ---
draw_set_font(Font1);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
menu_x = display_get_gui_width() / 2;
menu_y_start = display_get_gui_height() / 3;
back_button_y = menu_y_start + (array_length(options) * menu_line_sep);

// --- DESENHA TÍTULO ---
draw_set_color(c_white);
draw_text(menu_x, menu_y_start - 120, texto_titulo); // Usa a variável traduzida

// --- DESENHA AS OPÇÕES (LOOP) ---
for (var i = 0; i < array_length(options); i++) {
    var _opt = options[i];
    var _y = menu_y_start + i * menu_line_sep;
    var _val_string = "";
    
    // Formata o texto do valor da opção
    switch(_opt.type) {
        case "list":
            _val_string = _opt.values[variable_global_get(_opt.global_var)];
            break;
        case "slider":
            _val_string = string(variable_global_get(_opt.global_var));
            break;
    }
    
    // Desenha o rótulo da opção (ex: "IDIOMA")
    // Nota: _opt.label já vem traduzido do Evento Create
    draw_set_color(c_white);
    draw_text(menu_x, _y - 30, _opt.label);
    
    // Define a cor das setas e do texto com base no hover
    var _is_hovered = (hover_option == i);
    var _color_left = (_is_hovered && hover_arrow == -1) ? c_yellow : c_white;
    var _color_right = (_is_hovered && hover_arrow == 1) ? c_yellow : c_white;
    var _color_value = (_is_hovered) ? c_yellow : c_white;
    
    // Desenha o valor e as setas
    draw_set_color(_color_value);
    draw_text(menu_x, _y, _val_string);
    
    draw_set_color(_color_left);
    draw_text(menu_x - string_width(_val_string)/2 - 60, _y, "<");
    
    draw_set_color(_color_right);
    draw_text(menu_x + string_width(_val_string)/2 + 60, _y, ">");
}

// --- DESENHA BOTÃO VOLTAR ---
var _back_color = hover_back ? c_yellow : c_white;
draw_set_color(_back_color);
draw_text_transformed(menu_x, back_button_y, texto_voltar, back_scale, back_scale, 0); // Usa a variável traduzida

// --- RESETA CONFIGURAÇÕES DE DESENHO ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);