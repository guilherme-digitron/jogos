function draw_rainbow_text(texto, x_center, y_start, max_width) {
    var chars = [];
    var efeitos = [];
    var dentro_rainbow = false;

    // separar caracteres e tags
    for (var i = 1; i <= string_length(texto); i++) {
        var ch = string_char_at(texto,i);
        if (ch == "<") {
            if (string_copy(texto,i,9) == "<rainbow>") { dentro_rainbow = true; i += 8; continue; }
            if (string_copy(texto,i,10) == "</rainbow>") { dentro_rainbow = false; i += 9; continue; }
        }
        array_push(chars,ch);
        array_push(efeitos,dentro_rainbow ? "rainbow" : "");
    }

    // quebra de linha por palavra
    var linhas_arr = [];
    var efeitos_linhas = [];
    var linha_chars = [];
    var linha_effects = [];
    var linha_width = 0;
    var space_width = string_width(" ");

    for (var i = 0; i < array_length(chars);) {
        var start = i;
        while (i < array_length(chars) && chars[i] != " ") i += 1;
        var fim = i;

        var word_width = 0;
        for (var j = start; j < fim; j++) word_width += string_width(chars[j]);

        if (linha_width + word_width > max_width && array_length(linha_chars) > 0) {
            array_push(linhas_arr,linha_chars);
            array_push(efeitos_linhas,linha_effects);
            linha_chars = [];
            linha_effects = [];
            linha_width = 0;
        }

        for (var j = start; j < fim; j++) {
            array_push(linha_chars,chars[j]);
            array_push(linha_effects,efeitos[j]);
            linha_width += string_width(chars[j]);
        }

        if (i < array_length(chars) && chars[i] == " ") {
            array_push(linha_chars," ");
            array_push(linha_effects,efeitos[i]);
            linha_width += space_width;
            i += 1;
        }
    }

    if (array_length(linha_chars) > 0) {
        array_push(linhas_arr,linha_chars);
        array_push(efeitos_linhas,linha_effects);
    }

    // desenhar linhas
    var n_linhas = array_length(linhas_arr);
    var y_inicial = y_start - n_linhas*24/2;

    for (var i = 0; i < n_linhas; i++) {
        var linha = linhas_arr[i];
        var efeito_linha = efeitos_linhas[i];
        var larg_linha = 0;
        for (var k = 0; k < array_length(linha); k++) larg_linha += string_width(linha[k]);
        var x_linha = x_center - larg_linha/2;

        var x_offset = 0;
        for (var k = 0; k < array_length(linha); k++) {
            var ch = linha[k];
            var y_ch = y_inicial + i*24;

            if (efeito_linha[k] == "rainbow") {
                var r = 0.5 + 0.5*sin(current_time/200 + k/2);
                var g = 0.5 + 0.5*sin(current_time/200 + k/2 + 2);
                var b = 0.5 + 0.5*sin(current_time/200 + k/2 + 4);
                draw_set_color(make_color_rgb(r*255,g*255,b*255));
            } else {
                draw_set_color(c_red);
            }

            draw_text(x_linha + x_offset, y_ch, ch);
            x_offset += string_width(ch);
        }
    }
}
