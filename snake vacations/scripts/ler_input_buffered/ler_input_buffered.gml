// =================================================================
// Script: input_handler
// Contém todas as funções relacionadas ao controle do jogador.
// =================================================================

function ler_input() {
    // --- LÓGICA DE CONTROLE DE DESLIZE CONTÍNUO (MOBILE) ---
    var _input = noone;
    var DEADZONE = 25; // Aumentei um pouco para evitar mudanças acidentais

    // Verifica se o dedo está pressionando a tela
    if (device_mouse_check_button(0, mb_left)) {
        
        // Se for o primeiro toque, marca a posição inicial como centro
        if (!global.touch_active) {
            global.touch_start_x = device_mouse_x(0);
            global.touch_start_y = device_mouse_y(0);
            global.touch_active = true;
        }

        // Calcula a distância do ponto inicial até o ponto atual do dedo
        var dx = device_mouse_x(0) - global.touch_start_x;
        var dy = device_mouse_y(0) - global.touch_start_y;

        // Se o dedo se moveu o suficiente para fora da "zona morta"
        if (point_distance(0, 0, dx, dy) > DEADZONE) {
            
            // Verifica se o movimento é mais horizontal ou vertical
            if (abs(dx) > abs(dy)) {
                _input = (dx > 0) ? DIRECAO.DIREITA : DIRECAO.ESQUERDA;
            } else {
                _input = (dy > 0) ? DIRECAO.BAIXO : DIRECAO.CIMA;
            }
        }
        
    } else {
        // Se o jogador soltar o dedo, reseta o estado do toque
        global.touch_active = false;
    }

    // --- INPUT DE TECLADO (PARA TESTES NO PC) ---
    if (_input == noone) {
        if keyboard_check_pressed(vk_right) { _input = DIRECAO.DIREITA; }
        else if keyboard_check_pressed(vk_left) { _input = DIRECAO.ESQUERDA; }
        else if keyboard_check_pressed(vk_up) { _input = DIRECAO.CIMA; }
        else if keyboard_check_pressed(vk_down) { _input = DIRECAO.BAIXO; }
    }
    
    // --- ATUALIZA O BUFFER DE COMANDO ---
    if (_input != noone) {
        // Só aceita o comando se não for a direção oposta da atual
        if (_input != oposto(direcao_atual)) {
            proxima_direcao = _input;
        }
    }
}


function oposto(_dir) {
    // Retorna a direção oposta à fornecida
    switch (_dir) {
        case DIRECAO.DIREITA: return DIRECAO.ESQUERDA;
        case DIRECAO.ESQUERDA: return DIRECAO.DIREITA;
        case DIRECAO.CIMA: return DIRECAO.BAIXO;
        case DIRECAO.BAIXO: return DIRECAO.CIMA;
    }
    return noone;
}