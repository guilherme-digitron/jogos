// =================================================================
// Evento STEP do obj_cobra
// =================================================================

// 1. CHECAGEM DE ESTADO DO JOGO
// Para o jogo se estiver pausado ou o jogador morto.
if (global.paused or global.morte == 1) {
    exit;
}

// 2. LER INPUT DO JOGADOR
// Chama a função que lê o teclado ou o deslize do dedo na tela.
if (global.historia == 1) {
    ler_input();


// 3. APLICAR MUDANÇA DE DIREÇÃO (se o cooldown permitir)
if (pode_mudar_direcao and proxima_direcao != noone) {
    direcao_atual = proxima_direcao;
    proxima_direcao = noone; // Limpa o comando da fila
    
    // Ativa a trava e dispara o alarme de cooldown
    pode_mudar_direcao = false;
    alarm[0] = timer_cooldown;
}

// 4. TRADUZIR DIREÇÃO EM VETOR DE MOVIMENTO
var mov_h = 0;
var mov_v = 0;
switch (direcao_atual) {
    case DIRECAO.DIREITA: mov_h = 1; global.angulo = 0; break;
    case DIRECAO.ESQUERDA: mov_h = -1; global.angulo = 180; break;
    case DIRECAO.BAIXO:   mov_v = 1; global.angulo = 270; break;
    case DIRECAO.CIMA:    mov_v = -1; global.angulo = 90; break;
}

// 5. EXECUTAR MOVIMENTO CONTÍNUO E ATUALIZAR CORPO
pos[0] += mov_h * spd;
pos[1] += mov_v * spd;
atualiacao_lista(); // Sua função que atualiza o corpo

// 6. ATUALIZAR POSIÇÃO E GRÁFICOS
x = pos[0];
y = pos[1];
image_angle = global.angulo;

// 7. VERIFICAÇÕES DE LIMITE DE TELA E MORTE
if (x > 576 + 10) {
    pos[0] = 0;
    if (instance_exists(obj_controle) and obj_controle.create_growth == 1) { pos[1] = irandom_range(229, 760); }
}
if (x < 0 - 10) {
    pos[0] = 576;
    if (instance_exists(obj_controle) and obj_controle.create_growth == 1) { pos[1] = irandom_range(229, 760); }
}
if (global.life == 0) {
    morte_cobra();
}

// Sua lógica customizada
if (instance_exists(obj_controle) and obj_controle.create_gay) {
     gay();
}
}