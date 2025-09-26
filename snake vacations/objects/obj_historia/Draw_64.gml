/// DRAW EVENT
draw_set_font(fonte_falas);

if keyboard_check(vk_control){

	draw_text(100, 100, string(global.language))

}

// Largura máxima do texto (70%)
var largura_max = display_get_gui_width() * 0.8;

// Índices das falas do boss
var boss_indices = [10,11,12,13,14,15,16,17,18]; 
var is_boss = array_contains(boss_indices,fala_atual);

// Cor padrão do texto
var cor_texto = is_boss ? c_red : c_white;

// -------------------------------------------------------
// Preparar arrays de caracteres e efeitos
// -------------------------------------------------------
var chars = [];
var efeitos = []; // apenas "wave" ou ""
var dentro_wave = false;
var i = 1;
while (i <= string_length(texto_mostrado)) {
    var ch = string_char_at(texto_mostrado,i);

    // Detecta tags
    if (ch == "<") {
        if (string_copy(texto_mostrado,i,6) == "<wave>") { dentro_wave = true; i += 6; continue; }
        if (string_copy(texto_mostrado,i,7) == "</wave>") { dentro_wave = false; i += 7; continue; }
    }

    array_push(chars,ch);
    if (dentro_wave) array_push(efeitos,"wave");
    else array_push(efeitos,"");

    i += 1;
}

// -------------------------------------------------------
// Quebra de linha automática por palavra
// -------------------------------------------------------
var linhas_arr = [];
var efeitos_linhas = [];
var linha_atual = "";
var efeito_linha = [];

for (var j = 0; j < array_length(chars); j++) {
    var ch = chars[j];
    var efeito_ch = efeitos[j];

    linha_atual += ch;
    array_push(efeito_linha, efeito_ch);

    // Se passou da largura máxima
    if (string_width(linha_atual) > largura_max) {
        // Procurar último espaço
        var ultimo_espaco = 0;
        for (var k = string_length(linha_atual); k > 0; k--) {
            if (string_char_at(linha_atual, k) == " ") {
                ultimo_espaco = k;
                break;
            }
        }

        if (ultimo_espaco > 0) {
            // Linha antes do espaço (sem o próprio espaço)
            var linha_para_adicionar = string_copy(linha_atual, 1, ultimo_espaco - 1);

            // Copiar os efeitos correspondentes
            var efeitos_para_adicionar = [];
            if (ultimo_espaco > 1) {
                for (var ei = 0; ei <= ultimo_espaco - 2; ei++) {
                    array_push(efeitos_para_adicionar, efeito_linha[ei]);
                }
            }

            // Empilha linha + seus efeitos
            array_push(linhas_arr, string_trim(linha_para_adicionar));
            array_push(efeitos_linhas, efeitos_para_adicionar);

            // Resto da linha (pulando o espaço)
            var inicio_resto = ultimo_espaco + 1;
            var tam_resto = string_length(linha_atual) - ultimo_espaco;
            linha_atual = string_copy(linha_atual, inicio_resto, tam_resto);

            // Recria efeito_linha com o resto
            var new_efeito_linha = [];
            var totalE = array_length(efeito_linha);
            for (var fi = ultimo_espaco; fi < totalE; fi++) {
                array_push(new_efeito_linha, efeito_linha[fi]);
            }
            efeito_linha = new_efeito_linha;
        } else {
            // Palavra gigante sem espaço → quebra forçada
            array_push(linhas_arr, linha_atual);
            array_push(efeitos_linhas, efeito_linha);
            linha_atual = "";
            efeito_linha = [];
        }
    }
}

// Última linha
if (linha_atual != "") {
    array_push(linhas_arr, string_trim(linha_atual));
    array_push(efeitos_linhas, efeito_linha);
}

// -------------------------------------------------------
// Desenho das linhas
// -------------------------------------------------------
var n_linhas = array_length(linhas_arr);
var y_inicial = display_get_gui_height()/2 - n_linhas*24/2;

for (var li = 0; li < n_linhas; li++) {
    var linha = linhas_arr[li];
    var efeito_linha = efeitos_linhas[li];
    var larg_linha = string_width(linha);
    var x_centro = display_get_gui_width()/2 - larg_linha/2;
    var y_linha = y_inicial + li*24;

    for (var k = 0; k < string_length(linha); k++) {
        var ch = string_char_at(linha,k+1);
        var x_ch = x_centro + string_width(string_copy(linha,1,k));
        var y_ch = y_linha;

        // Wave effect
        if (efeito_linha[k] == "wave") y_ch += sin(current_time/100 + k*0.5)*4;

        draw_set_color(cor_texto);
        draw_text(x_ch, y_ch, ch);
    }
}

// -------------------------------------------------------
// Função auxiliar
// -------------------------------------------------------
function array_contains(arr,val) {
    for (var i = 0; i < array_length(arr); i++) if (arr[i] == val) return true;
    return false;
}
