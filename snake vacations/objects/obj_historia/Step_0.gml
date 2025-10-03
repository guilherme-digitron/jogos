
var boss_indices = [10,11,12,13,14,15,16,17,18]; 
// Digitação letra por letra
if (!terminou_fala) {
    typing_timer += 1;
    if (typing_timer >= typing_speed) {
        shown_chars += 1;
        typing_timer = 0;
    }

    var total_chars = hist_count_shown(falas[fala_atual]);
    texto_mostrado = hist_build_shown(falas[fala_atual], shown_chars);

    if (shown_chars >= total_chars) {
        terminou_fala = true;
    }
}

// Avançar fala no clique
if (mouse_check_button_pressed(mb_left) && pode_clicar) {
    pode_clicar = false;

    if (!terminou_fala) {
        // Pular digitação
        texto_mostrado = falas[fala_atual];
        terminou_fala = true;
    } else {
        // Próxima fala
        fala_atual += 1;

        if (fala_atual >= array_length(falas)) {
            // Última fala terminou → história completa
            historia = 1;
            fala_atual = array_length(falas) - 1; // mantém a última fala visível
            terminou_fala = true;
        } else {
            // Resetar digitação da próxima fala
            shown_chars = 0;
            typing_timer = 0;
            terminou_fala = false;
            texto_mostrado = "";
        }
    }
}

// Ativar boss nas falas corretas
if (array_contains(boss_indices, fala_atual)) {
    boss = 1
} else {
    boss = 0;
}

// Reset do clique
if (!mouse_check_button(mb_left)) {
    pode_clicar = true;
}

// Se a fala ESTÁ SENDO DIGITADA e o som AINDA NÃO COMEÇOU
if (!terminou_fala && !som_tocando) {
    var som_para_tocar = (boss == 1) ? Character_Vowel_1 : Character_Vowel_2;
    
    // Toca o som em loop e guarda o ID
    som_fala_id = audio_play_sound(som_para_tocar, 1, true);
    audio_sound_gain(som_fala_id, global.volume/global.sfx_volume, 0); // Usei o global.sfxvol do seu outro código
    
    // Marca que o som está tocando
    som_tocando = true;
}

// Se a fala TERMINOU DE SER DIGITADA e o som ESTAVA TOCANDO
if (terminou_fala && som_tocando) {
    // Para o som específico da fala
    if (audio_exists(som_fala_id)) {
        audio_stop_sound(som_fala_id);
    }
    
    // Marca que o som parou
    som_tocando = false;
    som_fala_id = noone;
}

// Quando avança para a próxima fala, precisamos resetar o controle do som
// Isso acontece quando o jogador clica e a fala já terminou
if (mouse_check_button_pressed(mb_left) && pode_clicar && terminou_fala) {
    // Se não for a última fala, reseta o estado do som para a próxima digitação
    if (fala_atual < array_length(falas) - 1) {
        som_tocando = false;
    }
}