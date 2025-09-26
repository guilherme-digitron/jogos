// Obtém a posição atual do mouse no espaço da GUI (interface gráfica)
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

// Obtém a metade da largura e altura do sprite do botão
var sprw = sprite_get_width(spr_btn) / 2
var sprh = sprite_get_height(spr_btn) / 2

// Define a posição central do botão (no caso, centralizado em 100x100 ajustado pelo tamanho do sprite)
var x1 = 100 + sprw
var y1 = 100 + sprh

// Define a fonte usada para o texto
draw_set_font(font_geral)

// Define o texto a ser exibido
var texto = "oi";

// Calcula a largura e altura do texto com base no conteúdo
var text_w = string_width(texto);
var text_h = string_height(texto);

// Calcula a posição X e Y do texto para que ele fique centralizado sobre o botão
var text_x = x1 - (text_w * escala) / 2;
var text_y = y1 - (text_h * escala) / 2;

// Verifica se o mouse está dentro da área retangular do botão
if (point_in_rectangle(mx, my, x1 - sprw, y1 - sprh, x1 + sprw, y1 + sprh)){

    // Define a transparência do botão como 0.8 (levemente transparente)
    alpha = 0.8

    // Suavemente aumenta a escala para 1.2 (efeito de hover/animação ao passar o mouse)
    escala = lerp(escala, 1.2, 0.08)

    // Se o botão esquerdo do mouse for pressionado enquanto estiver sobre o botão
    if (mouse_check_button_pressed(mb_left)) {
        
        // Exibe uma mensagem "oi"
        show_message("oi")
    }

} else {
    // Caso o mouse não esteja sobre o botão

    // Define a transparência de volta para 1 (opaco)
    alpha = 1

    // Retorna a escala suavemente para 1 (tamanho normal)
    escala = lerp(escala, 1, 0.08)
}

// Desenha o sprite do botão com escala, cor branca e transparência definida
draw_sprite_ext(spr_btn, 0, x1, y1, escala, escala, 0, c_white, alpha)

// Desenha o texto com a mesma escala e na posição centralizada
draw_text_transformed(text_x, text_y, texto, escala, escala, 0);

// Restaura a fonte padrão (nenhuma)
draw_set_font(-1)
