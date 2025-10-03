// =================================================================
// Evento CREATE do obj_cobra
// =================================================================

// --- Enums e Configurações Gerais ---
enum DIRECAO {
    DIREITA,
    ESQUERDA,
    BAIXO,
    CIMA
}

// --- Movimento e Controle ---
spd = 2; // Velocidade em pixels por frame. Ajuste para o seu gosto.
timer_cooldown = 15; // Cooldown de 1/4 de segundo (a 60fps) para mudar de direção.

direcao_atual = DIRECAO.DIREITA; // Direção inicial.
proxima_direcao = noone;         // Buffer para guardar o próximo comando.
pode_mudar_direcao = true;       // Trava do cooldown.

// --- Controle de Touch ---
global.touch_active = false;
global.touch_start_x = 0;
global.touch_start_y = 0;

// --- Lógica do Corpo da Cobra ---
global.ti = 0;
global.delay = 2;
global.position = ds_list_create();
pos = [x, y];
global.pos_cauda = 90;

// --- Suas Variáveis de Teste e Inicialização ---
time = 0;
novo_corpo = 0;
ncorpos = 0;
dt = 0;
color_timer = 0;
crecer();

// --- Sistema de Partículas ---
part_system_perso = part_system_create();
part_system_depth(part_system_perso, 0);

part_type_perso = part_type_create();
part_type_shape(part_type_perso, pt_shape_circle);
part_type_size(part_type_perso, 0.1, 0.3, 0, 0);
part_type_color1(part_type_perso, c_red);
part_type_speed(part_type_perso, 2, 5, 0, 0);
part_type_direction(part_type_perso, 0, 360, 0, 0);
part_type_gravity(part_type_perso, 0.3, 270);
part_type_life(part_type_perso, 30, 60);
part_type_alpha2(part_type_perso, 1, 0);