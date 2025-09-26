if (global.objeto_hover != noone) {
    draw_set_font(Font1);
    draw_set_color(c_white);

    // Mostra o nome técnico do objeto
    draw_text(mouse_x + 16, mouse_y, object_get_name(global.objeto_hover.object_index));
}
