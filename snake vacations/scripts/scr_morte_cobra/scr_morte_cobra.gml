function mover_cobra() {
    // Trava de segurança: não faz nada se o jogo estiver parado
    if (global.paused or global.morte == 1) {
        return;
    }

    // 1. APLICA O BUFFER
    if (proxima_direcao != noone) {
        direcao_atual = proxima_direcao;
        proxima_direcao = noone;
    }

    // 2. TRADUZ DIREÇÃO EM MOVIMENTO
    var mov_h = 0;
    var mov_v = 0;
    switch (direcao_atual) {
        case DIRECAO.DIREITA: mov_h = 1; global.angulo = 0; break;
        case DIRECAO.ESQUERDA: mov_h = -1; global.angulo = 180; break;
        case DIRECAO.BAIXO: mov_v = 1; global.angulo = 270; break;
        case DIRECAO.CIMA: mov_v = -1; global.angulo = 90; break;
    }
    
    // 3. EXECUTA O MOVIMENTO E ATUALIZA O CORPO
    pos[0] += mov_h * spd;
    pos[1] += mov_v * spd;
    atualiacao_lista();

    // 4. ATUALIZA A POSIÇÃO E GRÁFICOS DO OBJETO
    x = pos[0];
    y = pos[1];
    image_angle = global.angulo;

    // 5. VERIFICAÇÕES PÓS-MOVIMENTO (Lógica que estava no Step) << NOVO LOCAL
    // -----------------------------------------------------------------
    // Atravessar a tela (wrap around)
    if (x > 576 + 10) {
        pos[0] = 0;
        // Sua lógica customizada de reposicionamento vertical
        if (instance_exists(obj_controle) and obj_controle.create_growth == 1) {
            pos[1] = irandom_range(229, 760);
        }
    }
    if (x < 0 - 10) {
        pos[0] = 576;
        if (instance_exists(obj_controle) and obj_controle.create_growth == 1) {
            pos[1] = irandom_range(229, 760);
        }
    }
    
    // Checagem de morte (ex: vida acabou por colisão)
    if (global.life == 0) {
        morte_cobra();
        return; // Para a função aqui para não reiniciar o alarme
    }
    // -----------------------------------------------------------------

    // 6. REINICIA O CICLO
    alarm[0] = timer_velocidade;
}