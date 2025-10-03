switch (global.language) {
    
    // --- LÍNGUA INGLESA ---
    case 1:
        options = [
            // Opção 0: Idioma
            { 
                label: "LANGUAGE", 
                type: "list", 
                global_var: "language",
                values: ["PORTUGUÊS", "ENGLISH", "DEUTSCH"] 
            },
            // Opção 1: Volume Geral
            { 
                label: "MUSIC VOLUME", 
                type: "slider", 
                global_var: "master_volume",
                min: 0, 
                max: 100, 
                step: 5 
            },
            // Opção 2: Volume de Efeitos
            { 
                label: "EFFECTS VOLUME", 
                type: "slider", 
                global_var: "sfx_volume",
                min: 0, 
                max: 100, 
                step: 5 
            }
        ];
        break;

    // --- LÍNGUA ALEMÃ ---
    case 2:
        options = [
            // Opção 0: Idioma
            { 
                label: "SPRACHE", 
                type: "list", 
                global_var: "language",
                values: ["PORTUGUÊS", "ENGLISH", "DEUTSCH"] 
            },
            // Opção 1: Volume Geral
            { 
                label: "MUSIKLAUTSTÄRKE", 
                type: "slider", 
                global_var: "master_volume",
                min: 0, 
                max: 100, 
                step: 5 
            },
            // Opção 2: Volume de Efeitos
            { 
                label: "EFFEKTLAUTSTÄRKE", 
                type: "slider", 
                global_var: "sfx_volume",
                min: 0, 
                max: 100, 
                step: 5 
            }
        ];
        break;
        
    // --- LÍNGUA PORTUGUESA (Padrão) ---
    case 0:
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
        break;
}


// Pega as coordenadas do mouse na camada GUI
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Reseta os estados de hover
hover_option = -1;
hover_arrow = 0;
hover_back = false;

// --- VERIFICA INTERAÇÃO COM AS OPÇÕES ---
for (var i = 0; i < array_length(options); i++) {
    var _opt = options[i]; // Pega a opção atual para facilitar a leitura
    var _opt_y = menu_y_start + i * menu_line_sep;
    
    // --- CORREÇÃO AQUI ---
    // Primeiro verificamos o tipo da opção, DEPOIS calculamos a largura do texto.
    var _text_width = 0;
    if (_opt.type == "list") {
        // Se for uma lista, acessamos a array 'values'
        var _current_index = variable_global_get(_opt.global_var);
        _text_width = string_width(_opt.values[_current_index]) / 2;
    } 
    else if (_opt.type == "slider") {
        // Se for um slider, apenas convertemos o número para string
        _text_width = string_width(string(variable_global_get(_opt.global_var))) / 2;
    }
    
    // Define a área das setas
    var _arrow_offset = _text_width + 60;
    var _arrow_width = 50;
    var _arrow_height = 50;
    
    var _bb_left  = [menu_x - _arrow_offset - _arrow_width/2, _opt_y - _arrow_height/2, _arrow_width, _arrow_height];
    var _bb_right = [menu_x + _arrow_offset - _arrow_width/2, _opt_y - _arrow_height/2, _arrow_width, _arrow_height];
    
    // Checa hover nas setas
    if (point_in_rectangle(_mx, _my, _bb_left[0], _bb_left[1], _bb_left[0]+_bb_left[2], _bb_left[1]+_bb_left[3])) {
        hover_option = i;
        hover_arrow = -1;
    } else if (point_in_rectangle(_mx, _my, _bb_right[0], _bb_right[1], _bb_right[0]+_bb_right[2], _bb_right[1]+_bb_right[3])) {
        hover_option = i;
        hover_arrow = 1;
    }
}

// --- VERIFICA INTERAÇÃO COM O BOTÃO VOLTAR ---
var _back_text_w = string_width("VOLTAR");
var _back_text_h = string_height("VOLTAR");
if (point_in_rectangle(_mx, _my, menu_x - _back_text_w/2, back_button_y - _back_text_h/2, menu_x + _back_text_w/2, back_button_y + _back_text_h/2)) {
    hover_back = true;
}

// Efeito de escala no botão Voltar
back_scale = lerp(back_scale, (hover_back ? 1.2 : 1), 0.1);

// --- PROCESSA O CLIQUE ---
if (mouse_check_button_pressed(mb_left)) {
    // Se clicou em uma seta de opção
    if (hover_option != -1 && hover_arrow != 0) {
        var _opt = options[hover_option];
        var _current_val = variable_global_get(_opt.global_var);
        
        switch(_opt.type) {
            case "list":
                _current_val += hover_arrow;
                if (_current_val >= array_length(_opt.values)) _current_val = 0;
                if (_current_val < 0) _current_val = array_length(_opt.values) - 1;
                break;
            
            case "slider":
                _current_val += _opt.step * hover_arrow;
                _current_val = clamp(_current_val, _opt.min, _opt.max);
                break;
        }
        
        variable_global_set(_opt.global_var, _current_val);
        
        // Aplica mudança de volume em tempo real
        if (_opt.global_var == "master_volume") audio_master_gain(global.master_volume / 100);
        
        audio_play_sound(Menu_Select, 1, false, global.volume/global.sfx_volume);
    }
    
    // Se clicou no botão Voltar
    if (hover_back) {
        obj_manager.save_settings(); // Salva tudo antes de sair
        room_goto(ROOM_INICIAL); // << MUDE PARA A SUA ROOM DE MENU PRINCIPAL
    }
}