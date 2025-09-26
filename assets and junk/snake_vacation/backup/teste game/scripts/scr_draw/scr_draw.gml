function draw_timer_curse(){
	
	draw_self()
	draw_set_font(font_geral);  // Defina a fonte antes de medir
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	var texto = string(time_death);
	var x_central = x + largura / 2 - 14;
	var y_central = y + altura / 2;

	var cor_texto = c_white;
	var cor_contorno = c_black;
	var grossura_contorno = 3;
	var espaco_entre_letras = 7;

	draw_text_outline_spacing(x_central, y_central, texto, font_geral, fa_center, fa_middle, cor_texto, cor_contorno, grossura_contorno, espaco_entre_letras);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

}