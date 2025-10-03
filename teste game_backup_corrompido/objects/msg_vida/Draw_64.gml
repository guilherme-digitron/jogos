draw_set_halign(fa_center);
draw_set_font(Font1)
var x_pos = x
var y_pos = y
var txt = "Lf +1" 


draw_set_color(c_black);
draw_text(x_pos - 1, y_pos - 1, txt);
draw_text(x_pos + 1, y_pos - 1, txt);
draw_text(x_pos - 1, y_pos + 1, txt);
draw_text(x_pos + 1, y_pos + 1, txt);
draw_text(x_pos,     y_pos - 1, txt);
draw_text(x_pos,     y_pos + 1, txt);
draw_text(x_pos - 1, y_pos,     txt);
draw_text(x_pos + 1, y_pos,     txt);

draw_set_color(c_white)
draw_text(x, y,"Lf +1");
draw_set_halign(fa_left); // volta ao padrão