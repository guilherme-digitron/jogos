// Obtém a posição atual do mouse na GUI
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

// Define a fonte e alinhamentos de texto (centralizado na horizontal e vertical)
draw_set_font(font_geral)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// Obtém o tamanho do array de opções do menu
var tamanho_menu = array_length(menu_inicial)

for(var i = 0; i < tamanho_menu; i++) {

    // Pega a largura e altura da GUI
    var wgui = display_get_gui_width()
    var hgui = display_get_gui_height()

    // Altura e largura do texto (a altura usa a letra "I" como referência)
    var strh = string_height("I")
    var strw = string_width(menu_inicial[i])

    // Calcula a posição da caixa de colisão de cada item do menu (retângulo do botão)
    var x1 = wgui / 2 - strw / 2
    var y1 = hgui / 2 - strh / 2 + strh * i
    var x2 = wgui / 2 + strw / 2
    var y2 = hgui / 2 + strh / 2 + strh * i

    // Verifica se o mouse está sobre o item do menu
    if (point_in_rectangle(mx, my, x1, y1, x2, y2)) {

        // Aumenta suavemente a escala do item do menu (efeito de hover)
        escala[i] = lerp(escala[i], 1.4, 0.15)

        // Se o mouse for clicado enquanto está sobre esse item
        if (mouse_check_button_pressed(mb_left)) {

            // Executa uma ação com base na opção clicada
            switch menu_inicial[i] {
                
                case menu_inicial[0]: // Primeira opção
                    show_message("vamos jogar")
                    break
                    
                case menu_inicial[1]: // Segunda opção
                    show_message("opcoes muito legais")
                    break
                    
                case menu_inicial[2]: // Terceira opção
                    show_message("-_-")
                    break
            }
        }

    } else {
        // Caso o mouse não esteja sobre o item, retorna a escala para 1 (normal)
        escala[i] = lerp(escala[i], 1, 0.15)
    }

    // Desenha o texto com a escala atual (pode estar ampliado se estiver com hover)
    draw_text_transformed(wgui / 2, hgui / 2 + strh * i, menu_inicial[i], escala[i], escala[i], 0);
}

// Restaura os alinhamentos e fonte para o padrão
draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)
