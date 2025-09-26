// Verifica clique ou toque
if (mouse_check_button_pressed(mb_left) || device_mouse_check_button_pressed(0, mb_left)) {
    
    // Detecta posição do clique/toque
    var _input_x = mouse_x;
    var _input_y = mouse_y;

    if (device_mouse_check_button_pressed(0, mb_left)) {
        _input_x = device_mouse_x(0);
        _input_y = device_mouse_y(0);
    }

    // Verifica se clicou dentro da área do botão
    if (point_in_rectangle(_input_x, _input_y, x, y, x + largura, y + altura)) {
        room_goto(room_destino);
    }
}
