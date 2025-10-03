// Evento Draw de o_leaderboard_screen
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font_geral); // Defina sua fonte

draw_text(100, 50, "LEADERBOARD");

var _array_size = array_length(global.leaderboard_scores);
if (_array_size == 0) {
    draw_text(100, 100, "Carregando...");
} else {
    for (var i = 0; i < _array_size; i++) {
        var _entry = global.leaderboard_scores[i];
        var _text = string(i + 1) + ". " + _entry.name + " - " + string(_entry.score);
        draw_text(100, 100 + (i * 40), _text); // 40 é o espaçamento vertical
    }
}