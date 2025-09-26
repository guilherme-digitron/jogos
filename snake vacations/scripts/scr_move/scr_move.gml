function move() {

// =========================
// MOVIMENTAÇÃO (Step Event)
// =========================

if pode_mover == true {

	// Zona morta para swipe
	var DEADZONE = 20;

	// --- INPUT DE TECLADO ---
	if keyboard_check_pressed(vk_left) and global.active_direction != 2 {
	    mov_h = -1;
	    mov_v = 0;
	    global.active_direction = 1; // esquerda
	}
	else if keyboard_check_pressed(vk_right) and global.active_direction != 1 {
	    mov_h = 1;
	    mov_v = 0;
	    global.active_direction = 2; // direita
	}
	else if keyboard_check_pressed(vk_down) and global.active_direction != 4 {
	    mov_v = 1;
	    mov_h = 0;
	    global.active_direction = 3; // baixo
	}
	else if keyboard_check_pressed(vk_up) and global.active_direction != 3 {
	    mov_v = -1;
	    mov_h = 0;
	    global.active_direction = 4; // cima
	}

	// --- INPUT DE TOUCH (swipe) ---
	if device_mouse_check_button(0, mb_left) {
	    if !global.touch_active {
	        // Pega o ponto inicial só quando começa o toque
	        global.touch_start_x = device_mouse_x(0);
	        global.touch_start_y = device_mouse_y(0);
	        global.touch_active = true;
	    }

	    var dx = device_mouse_x(0) - global.touch_start_x;
	    var dy = device_mouse_y(0) - global.touch_start_y;

	    // Se passou da zona morta, decide direção
	    if abs(dx) > DEADZONE or abs(dy) > DEADZONE {
	        if abs(dx) > abs(dy) {
	            // Movimento horizontal
	            if dx > 0 and global.active_direction != 1 {
	                mov_h = 1;
	                mov_v = 0;
	                global.active_direction = 2; // direita
	            }
	            else if dx < 0 and global.active_direction != 2 {
	                mov_h = -1;
	                mov_v = 0;
	                global.active_direction = 1; // esquerda
	            }
	        }
	        else {
	            // Movimento vertical
	            if dy > 0 and global.active_direction != 4 {
	                mov_v = 1;
	                mov_h = 0;
	                global.active_direction = 3; // baixo
	            }
	            else if dy < 0 and global.active_direction != 3 {
	                mov_v = -1;
	                mov_h = 0;
	                global.active_direction = 4; // cima
	            }
	        }

	        // 🔑 Reset do ponto inicial para não acumular swipe
	        global.touch_start_x = device_mouse_x(0);
	        global.touch_start_y = device_mouse_y(0);
	    }
	}
	else {
	    global.touch_active = false;
	}
	pode_mover = false
}

// --- MOVIMENTO FINAL ---
// (para Snake: o jogador só anda em grid, então pos[] pode ser substituído por x/y)
pos[0] += mov_h * spd;
pos[1] += mov_v * spd;

   
}
