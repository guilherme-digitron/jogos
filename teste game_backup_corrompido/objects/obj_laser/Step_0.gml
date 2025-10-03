// Incrementa o tempo de vida
vida_atual += 1;

// Calcula o progresso da vida (de 1 a 0)
var progresso = (vida_maxima - vida_atual) / vida_maxima;

// Garante que o progresso não seja menor que 0
progresso = max(0, progresso);

// Afina o laser (altera a escala vertical)
image_yscale = progresso;

// Faz o laser desaparecer (altera a transparência)
image_alpha = progresso;

// Destrói o laser quando o tempo de vida acabar
if (vida_atual >= vida_maxima) {
    instance_destroy();
}