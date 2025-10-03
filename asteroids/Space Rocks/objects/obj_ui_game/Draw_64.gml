//pontuaçao
draw_set_color(c_white);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(room_width/2,room_height*0.1, string(global.points),1.5,1.5,0)