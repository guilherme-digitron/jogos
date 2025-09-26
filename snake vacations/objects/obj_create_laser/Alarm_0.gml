// ALARM[0]
// escolhe nova direção do laser
sector = irandom(3);

switch (sector) {
    case 0: x = pos[0][0]; y = pos[0][1]; x2 = pos[1][0]; y2 = pos[1][1]; break;
    case 1: x = pos[1][0]; y = pos[1][1]; x2 = pos[0][0]; y2 = pos[0][1]; break;
    case 2: x = pos[2][0]; y = pos[2][1]; x2 = pos[3][0]; y2 = pos[3][1]; break;
    case 3: x = pos[3][0]; y = pos[3][1]; x2 = pos[2][0]; y2 = pos[2][1]; break;
}

// reinicia o progresso
progress = 0;
len_drawn = 0;

// dispara próximo laser em 120 frames
alarm[0] = irandom_range(120, 360);
