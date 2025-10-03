// Move a posição Y do texto para cima a cada frame
y_pos -= scroll_speed;

// Verifica se a última linha de texto já saiu completamente da tela
if (y_pos < -total_text_height) {
    // Quando acabar, volta para o menu principal (substitua 'rm_menu' pelo nome da sua sala de menu)
    room_goto(ROOM_INICIAL); 
	audio_stop_all()
}

// Permite que o jogador pule os créditos pressionando Enter ou Esc
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_any)) {
    // Vai para o menu principal imediatamente
    room_goto(ROOM_INICIAL);
	audio_stop_all()
}