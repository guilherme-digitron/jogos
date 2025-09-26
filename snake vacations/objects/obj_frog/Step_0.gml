// ---------------------------
// IA de perseguição
// ---------------------------
hover_mouse();
if (global.paused) {exit}
if (global.morte == 1) {exit}

if (sprite_index == spr_sapo_atk) {
    if (place_meeting(x, y, obj_personagem)) {
        
    }
}

// Calcular distâncias em X e Y até o player
xd = abs(obj_personagem.x - x);
yd = abs(obj_personagem.y - y);

// Escolher direção
if (xd > yd) {
    des = 1; // mover horizontal
    dir = (obj_personagem.x > x) ? 1 : 2; // direita ou esquerda
} else {
    des = 0; // mover vertical
    dir = (obj_personagem.y > y) ? 3 : 4; // baixo ou cima
}

// Ativar alarm de movimento
if (dir != 0 && alarm[0] == -1) {
    alarm[0] = 30;
}

// ---------------------------
// ATAQUE (quando perto do player)
// ---------------------------
if (xd < ti || yd < ti) {
    sprite_index = spr_sapo_atk;
} else {
    sprite_index = spr_sapo;
}

// ---------------------------
// MOVIMENTO SUAVE COM LERP
// ---------------------------
// alvo_x e alvo_y devem ser definidos no alarm[0]
var nx = lerp(x, alvo_x, 0.2); 
var ny = lerp(y, alvo_y, 0.2);

// ---------------------------
// COLISÃO COM obj_hall E obj_spikes
// ---------------------------
if (!place_meeting(nx, y, obj_block_curse)) {
    x = nx;
}
if (!place_meeting(x, ny, obj_block_curse)) {
    y = ny;
}
