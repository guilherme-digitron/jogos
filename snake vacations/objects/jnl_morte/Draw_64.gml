// =================================================================================
// CÓDIGO PARA O EVENTO DRAW (DESENHAR)
// =================================================================================

// --- 1. Definição de Textos Traduzíveis ---
// Os textos são definidos com base em uma variável global 'global.language'
// 0 = Português (Padrão), 1 = Inglês, 2 = Alemão

var texto_morte = "Você MORREU";
var texto_pontos = "Pontos: ";
var texto_recorde = "Seu Recorde: ";
var texto_botao_tentar = "Tentar novamente?";
var texto_botao_menu = "Menu Inicial";

switch (global.language) {
    case 1: // English
        texto_morte = "You DIED";
        texto_pontos = "Score: ";
        texto_recorde = "Your Highscore: ";
        texto_botao_tentar = "Try again?";
        texto_botao_menu = "Main Menu";
        break;

    case 2: // German
        texto_morte = "Du BIST GESTORBEN";
        texto_pontos = "Punkte: ";
        texto_recorde = "Dein Rekord: ";
        texto_botao_tentar = "Nochmal versuchen?";
        texto_botao_menu = "Hauptmenü";
        break;
}

// --- 2. Configurações de Desenho e Posições ---

// Pega as dimensões da GUI para garantir que o layout se adapte a qualquer tela
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var cx = gui_w / 2; // Posição X central
var cy = gui_h / 2; // Posição Y central

// Define a fonte e o alinhamento para todo o texto
draw_set_font(Font1); // <- SUBSTITUA 'Font1' pelo nome da sua fonte
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- 3. Desenho dos Elementos na Tela ---

// --- Mensagem de Morte Pulsante ---
draw_set_color(c_white);
var escala_pulsante = 1 + 0.05 * sin(current_time / 150);
draw_text_transformed(cx, cy - 200, texto_morte, escala_pulsante, escala_pulsante, 0);

// --- Pontos e Recorde ---
draw_text(cx, cy - 120, texto_pontos + string(global.cont));
draw_text(cx, cy - 80, texto_recorde + string(global.record));

draw_set_valign(fa_top);
var palavras = string_split(frase_completa, " ");
var linha = "";
var y_offset_frase = cy - 20; // Posição inicial da frase

for (var i = 0; i < array_length(palavras); i++) {
    var teste_linha = linha + (linha == "" ? "" : " ") + palavras[i];
    if (string_width(teste_linha) > max_width) {
        draw_text(cx, y_offset_frase, linha);
        linha = palavras[i];
        y_offset_frase += string_height(linha) + 5;
    } else {
        linha = teste_linha;
    }
}
if (linha != "") {
    draw_text(cx, y_offset_frase, linha);
}
draw_set_valign(fa_middle); // Restaura o alinhamento vertical

// --- 4. Lógica e Desenho dos Botões Interativos ---

// Pega as coordenadas do mouse na camada de GUI
mx = device_mouse_x_to_gui(0);
my = device_mouse_y_to_gui(0);

// --- Função reutilizável para desenhar e gerenciar os botões ---
function desenhar_botao(_x, _y, _texto, _room_destino) {
    var _largura = string_width(_texto);
    var _altura = string_height(_texto);
    var _escala = 1.0; // Escala padrão

    // Verifica se o mouse está sobre a área do botão
    var _mouse_over = point_in_rectangle(mx, my, _x - _largura / 2, _y - _altura / 2, _x + _largura / 2, _y + _altura / 2);

    if (_mouse_over) {
        _escala = 1.2; // Aumenta a escala para dar feedback visual

        // Toca o som de hover apenas uma vez ao entrar na área do botão
        if (!variable_global_exists("hover_sound_played") || global.hover_sound_played != _texto) {
            var som = audio_play_sound(Menu_Select, 1, false);
			audio_sound_gain(som, global.volume/global.sfx_volume, 0)
            global.hover_sound_played = _texto;
        }

        // Verifica se o botão foi clicado
        if (mouse_check_button_pressed(mb_left)) {
            room_goto(_room_destino);
        }
    }

    // Desenha o texto do botão com a escala calculada
    draw_set_color(c_white);
    draw_text_transformed(_x, _y, _texto, _escala, _escala, 0);

    return _mouse_over;
}

// --- Posições Y dos botões ---
var y_botao_tentar = cy + 150;
var y_botao_menu = cy + 220;

// Desenha os dois botões na tela
var mouse_sobre_tentar = desenhar_botao(cx, y_botao_tentar, texto_botao_tentar, ROOM_NOVAMENTE); // <- SUBSTITUA 'ROOM_NOVAMENTE'
var mouse_sobre_menu = desenhar_botao(cx, y_botao_menu, texto_botao_menu, ROOM_INICIAL);       // <- SUBSTITUA 'ROOM_MENU'

// Se o mouse não estiver sobre nenhum dos botões, reseta a variável de controle do som
if (!mouse_sobre_tentar && !mouse_sobre_menu) {
    global.hover_sound_played = noone; 
}