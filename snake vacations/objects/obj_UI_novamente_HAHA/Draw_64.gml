draw_set_color(c_white);
draw_set_font(Font1);
draw_set_alpha(alpha);

// Desenhar o hahaha com escala
draw_text_transformed(x, y, "HA", scale, scale, 0);

draw_set_alpha(1); // resetar opacidade para outros desenhos
