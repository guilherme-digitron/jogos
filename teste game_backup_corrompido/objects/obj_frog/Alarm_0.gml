// Definir alvo de posição
alvo_x = x;
alvo_y = y;

// Definir alvo apenas uma vez
switch (dir) {
    case 1: alvo_x = x + ti; alvo_y = y; break; // direita
    case 2: alvo_x = x - ti; alvo_y = y; break; // esquerda
    case 3: alvo_y = y + ti; alvo_x = x; break; // baixo
    case 4: alvo_y = y - ti; alvo_x = x; break; // cima
}

