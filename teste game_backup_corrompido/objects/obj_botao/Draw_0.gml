// Desenha o sprite se existir
if (sprite_index != -1) {
    draw_self();
} else {
    // Desenha retângulo como fallback
    draw_set_color(c_gray);
    draw_rectangle(x, y, x + largura, y + altura, false);
}

// Texto centralizado
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(cor_texto);
draw_text(x + largura / 2, y + altura / 2, texto_botao);

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);