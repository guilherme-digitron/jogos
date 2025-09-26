function draw_text_outline_spacing(_x, _y, _texto, _font, _halign, _valign, _cor_texto, _cor_contorno, _cont_thickness, _espacamento) {
    draw_set_font(_font);
    draw_set_halign(_halign);
    draw_set_valign(_valign);

    // Desenha contorno
    for (var dx = -_cont_thickness; dx <= _cont_thickness; dx++) {
        for (var dy = -_cont_thickness; dy <= _cont_thickness; dy++) {
            if (dx != 0 || dy != 0) {
                var px = _x + dx;
                var py = _y + dy;
                var px_cursor = px;
                for (var i = 1; i <= string_length(_texto); i++) {
                    var ch = string_char_at(_texto, i);
                    draw_set_color(_cor_contorno);
                    draw_text(px_cursor, py, ch);
                    px_cursor += string_width(ch) + _espacamento;
                }
            }
        }
    }

    // Desenha texto principal
    var px_cursor = _x;
    for (var i = 1; i <= string_length(_texto); i++) {
        var ch = string_char_at(_texto, i);
        draw_set_color(_cor_texto);
        draw_text(px_cursor, _y, ch);
        px_cursor += string_width(ch) + _espacamento;
    }

    draw_set_color(c_white);
}
