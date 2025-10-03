// --- Lógica de Interação Mobile ---
// Pega as coordenadas do mouse/toque na camada de GUI
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Pega as dimensões da tela para calcular a posição dos botões
var _view_w = display_get_gui_width();
var _center_x = _view_w / 2;
var _center_y = display_get_gui_height() / 2;

// Define a posição Y dos botões
var _continue_y = _center_y + 40;
var _main_menu_y = _center_y + 110;

// Guarda a opção anterior antes de calcular a nova
var _previous_hover = hover_option;
hover_option = -1; // Começa assumindo que não está sobre nenhum botão

// --- Detecção de Hover nos Botões ---
// --- Detecção de Hover nos Botões ---

// Botão Continuar
var _bbox_continue = get_button_bbox(continue_button_text, _center_x, _continue_y);
if (point_in_rectangle(_mx, _my, _bbox_continue.x1, _bbox_continue.y1, _bbox_continue.x2, _bbox_continue.y2)) {
    hover_option = 0;
}
// Botão Menu Inicial
else {
    // CORREÇÃO APLICADA AQUI
    var _bbox_main_menu = get_button_bbox(main_menu_button_text, _center_x, _main_menu_y);
    if (point_in_rectangle(_mx, _my, _bbox_main_menu.x1, _bbox_main_menu.y1, _bbox_main_menu.x2, _bbox_main_menu.y2)) {
        hover_option = 1;
    }
}

// Toca o som APENAS se a opção de hover mudou para uma nova válida
if (hover_option != _previous_hover && hover_option != -1) {
    sfx = audio_play_sound(Menu_Select, 1, false);
	audio_sound_gain(sfx,global.volume/global.sfx_volume, 0);
}

// Lógica de interpolação da escala para suavidade
for (var i = 0; i < 2; i++) {
    var _target_scale = (i == hover_option) ? selected_scale : base_scale;
    button_scale[i] = lerp(button_scale[i], _target_scale, 0.2);
}

// Ação ao clicar
if (mouse_check_button_pressed(mb_left)) {
    switch (hover_option) {
        case 0: // Continuar
		
			sfx = audio_play_sound(Start_Game, 1, false);
			audio_sound_gain(sfx, global.volume/global.sfx_volume, 0);
			global.paused = false
			instance_destroy()
            break;
        case 1: // Menu Inicial
			sfx = audio_play_sound(Start_Game, 1, false);
			audio_sound_gain(sfx, global.volume/global.sfx_volume, 0);
            room_goto(ROOM_INICIAL);
            break;
    }
}

// A função get_button_bbox continua a mesma
function get_button_bbox(text, x, y) {
    draw_set_font(Font1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _w = string_width(text) / 2;
    var _h = string_height(text) / 2;
    return {
        x1: x - _w - 10,
        y1: y - _h - 10,
        x2: x + _w + 10,
        y2: y + _h + 10
    };
}