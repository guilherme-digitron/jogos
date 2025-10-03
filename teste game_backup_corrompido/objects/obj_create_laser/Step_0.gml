// STEP
// Avança o progresso do laser

if global.paused == false {
progress += vel;
if (progress > 1) {
    progress = 1;
}

// Calcula o comprimento total que o feixe deve ter neste frame
var dx = x2 - x;
var dy = y2 - y;
var px = x + dx * progress;
var py = y + dy * progress;
var len_now = point_distance(x, y, px, py);

// Pega a direção do feixe
var dir_now = point_direction(x, y, x2, y2);

// Otimização: Só cria os novos pedaços do laser
// O loop começa de onde paramos (len_drawn) e vai até o comprimento atual (len_now)
var step_size = sprite_get_width(spr_laser); // Use uma referência direta ao sprite

for (var i = len_drawn; i <= len_now; i += step_size) {
    var lx = x + lengthdir_x(i, dir_now);
    var ly = y + lengthdir_y(i, dir_now);
    
    var inst = instance_create_layer(lx, ly, "Instances", obj_laser);
    inst.image_angle = dir_now;
    // A variável "creator" não é mais necessária para destruir, mas é bom manter
    inst.creator = id; 
}

// Atualiza o comprimento já desenhado para o próximo frame
len_drawn = len_now;
}