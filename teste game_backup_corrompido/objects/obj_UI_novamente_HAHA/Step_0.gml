// Movimento
x += speed_x;
y += speed_y;

// Diminuir tamanho e opacidade
scale -= scale_speed;
alpha -= fade_speed;

// Destruir quando sumir
if (alpha <= 0 || scale <= 0) {
    instance_destroy();
}
