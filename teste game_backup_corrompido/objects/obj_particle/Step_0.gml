// Movimentando a partícula
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Incrementando idade
age += 1;

// Apagar quando acabar o tempo de vida
if (age >= lifetime) {
    instance_destroy();
}
