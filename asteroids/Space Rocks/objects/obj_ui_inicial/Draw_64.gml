var _altura = display_get_gui_height() / 2;
var _largura = display_get_gui_width() / 2;
var _options = array_length(menu);
var _altura_total = _options * 50;
var _inicial_y = _altura - _altura_total / 2;
var _mousex = device_mouse_x(0);
var _mousey = device_mouse_y(0);

draw_set_color(c_white);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < _options; i++) {

    var _item_y = _inicial_y + i * 50;
    var _texto = menu[i];
    var _strh = 50;
    var _strw = string_width(_texto);

    var x1 = _largura - _strw / 2;
    var y1 = _item_y - _strh / 2;
    var x2 = _largura + _strw / 2;
    var y2 = _item_y + _strh / 2;

    if (point_in_rectangle(_mousex, _mousey, x1, y1, x2, y2)) {
        escala[i] = lerp(escala[i], 1.4, 0.15);
		
		if mouse_check_button(mb_left){
		
			switch (i) {
			
				case 0: room_goto(ROOM_GAME); break;
				case 1: room_goto(ROOM_GAME); break;
				case 2: room_goto(ROOM_GAME); break;
				case 3: game_end(); break;
			
			}
		
		}
		
    } else {
        escala[i] = lerp(escala[i], 1.0, 0.15);
    }

    draw_text_transformed(_largura, _item_y, _texto, escala[i], escala[i], 0);
}