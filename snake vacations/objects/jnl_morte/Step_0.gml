// --- Atualiza digitação da frase se pausado ---
if (global.morte == 1) {
    dig_timer += 1;
    if (dig_timer >= dig_speed) {
        dig_timer = 0;
        if (frase_index < string_length(frase_atual)) {
            frase_index += 1;
            frase_completa = string_copy(frase_atual, 1, frase_index);
        }
    }	
}
