options = [
    // Opção 0: Idioma
    { 
        label: "IDIOMA", 
        type: "list", 
        global_var: "language",
        values: ["PORTUGUÊS", "ENGLISH", "DEUTSCH"] 
    },
    // Opção 1: Volume Geral
    { 
        label: "VOLUME MÚSICAS", 
        type: "slider", 
        global_var: "master_volume",
        min: 0, 
        max: 100, 
        step: 5 
    },
    // Opção 2: Volume de Efeitos
    { 
        label: "VOLUME EFEITOS", 
        type: "slider", 
        global_var: "sfx_volume",
        min: 0, 
        max: 100, 
        step: 5 
    }
];

// --- LAYOUT E POSICIONAMENTO (BASEADO NA GUI) ---
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

menu_x = display_get_gui_width() / 2;
menu_y_start = display_get_gui_height() / 3;
menu_line_sep = 100; // Espaço vertical entre cada opção

// Variáveis de interação
hover_option = -1; // Qual opção está com o mouse em cima (-1 = nenhuma)
hover_arrow = 0;   // Em qual seta o mouse está (-1 = esquerda, 1 = direita)
hover_back = false; // Mouse em cima do botão voltar
back_scale = 1;     // Escala do botão voltar
back_button_y = menu_y_start + (array_length(options) * menu_line_sep);