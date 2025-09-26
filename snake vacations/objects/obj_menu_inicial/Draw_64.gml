// Evento Draw do obj_menu
var sfx = 0
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Define a fonte e alinhamentos de texto
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var tamanho_menu = array_length(menu_inicial);
var espaco = 2;
var wgui = display_get_gui_width();
var hgui = display_get_gui_height();
var strh = string_height("I");
var total_height = (tamanho_menu - 1) * strh * espaco;
var start_y = hgui / 2 - total_height / 2;

// Variável para guardar qual opção está com o mouse em cima NESTE frame
var opcao_atual = -1;

for (var i = 0; i < tamanho_menu; i++) {
    var strw = string_width(menu_inicial[i]);
    var y_offset = start_y + (strh * espaco * i);
    var x1 = wgui / 2 - strw / 2;
    var y1 = y_offset - strh / 2;
    var x2 = wgui / 2 + strw / 2;
    var y2 = y_offset + strh / 2;

    // Verifica se o mouse está sobre o item do menu
    if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {
        
        // Guarda o índice da opção que está com o mouse em cima
        opcao_atual = i;
        
        // Aumenta suavemente a escala do item do menu
        escala[i] = lerp(escala[i], 1.8, 0.15);

        // Se o mouse for clicado enquanto está sobre esse item
        if (mouse_check_button_pressed(mb_left)) {
            // Executa uma ação com base na opção clicada
            switch (menu_inicial[i]) {
                case menu_inicial[0]:
                    sfx = audio_play_sound(Start_Game, 1, false);
                    audio_sound_gain(sfx, global.sfx_volume/100, 0);
                    room_goto(ROOM_GAME_HISTORI);
                    break;
                case menu_inicial[1]:
                    global.historia = 1;
                    sfx = audio_play_sound(Start_Game, 1, false);
                    audio_sound_gain(sfx, global.sfx_volume/100, 0);
                    room_goto(ROOM_GAME);
                    break;
                case menu_inicial[2]:
					sfx = audio_play_sound(Start_Game, 1, false);
                    audio_sound_gain(sfx, global.sfx_volume/100, 0);
                    room_goto(ROOM_OPCOES);
                    break;			
			   case menu_inicial[3]:
					sfx = audio_play_sound(Start_Game, 1, false);
                    audio_sound_gain(sfx, global.sfx_volume/100, 0);
                    room_goto(ROOM_CREDITOS);
					break;
                case menu_inicial[4]:
					sfx = audio_play_sound(Start_Game, 1, false);
                    audio_sound_gain(sfx, global.sfx_volume/100, 0);
                    game_end();
                    break;
            }
        }
    } else {
        // Caso o mouse não esteja sobre o item, retorna a escala para 1.4
        escala[i] = lerp(escala[i], 1.4, 0.15);
    }

    // Desenha o texto com a escala atual
    draw_text_transformed(wgui / 2, y_offset, menu_inicial[i], escala[i], escala[i], 0);
}

// --- LÓGICA DO SOM (FORA DO LOOP) ---
// Verifica se a opção com o mouse em cima MUDOU desde o último frame
if (opcao_atual != opcao_anterior) {
    // Se a nova opção não for "nenhuma" (-1), toca o som
    if (opcao_atual != -1) {
        sfx = audio_play_sound(Menu_Select, 1, false);
        audio_sound_gain(sfx, global.sfx_volume, 0);
    }
    // Atualiza a variável para o próximo frame
    opcao_anterior = opcao_atual;
}

// Restaura os alinhamentos e fonte para o padrão
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);