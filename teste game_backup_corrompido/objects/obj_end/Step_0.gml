// ----------------------------
// CONTROLE DE CLIQUE SEGURO
// ----------------------------
var mouse_down = mouse_check_button(mb_left);
var mouse_click = (mouse_down && !mouse_held);
mouse_held = mouse_down;

// ----------------------------
// DIGITAÇÃO DO TEXTO
// ----------------------------
if (!terminou_fala) {

    if (mouse_click) {
        // Clicar durante digitação → completa a fala
        texto_mostrado = texto_completo;
        terminou_fala = true;
        pos_texto = string_length(texto_completo) + 1;
    } else {
        // Digitação normal
        typing_timer += 1;
        if (typing_timer >= typing_speed) {
            typing_timer = 0;

            if (pos_texto > string_length(texto_completo)) {
                terminou_fala = true;
            } else {
                // Detecta tags <rainbow>
                if (string_copy(texto_completo,pos_texto,9) == "<rainbow>") {
                    texto_mostrado += "<rainbow>";
                    pos_texto += 9; // pula a tag
                } 
                else if (string_copy(texto_completo,pos_texto,10) == "</rainbow>") {
                    texto_mostrado += "</rainbow>";
                    pos_texto += 10; // pula a tag
                } 
                else {
                    texto_mostrado += string_char_at(texto_completo,pos_texto);
                    pos_texto += 1;
                }
            }
        }
    }

} else {
    // ----------------------------
    // AVANÇAR PARA PRÓXIMA FALA
    // ----------------------------

    // Permite clique apenas após o botão ser liberado
    if (!mouse_down) {
        pode_clicar = true;
    }

    // Avança fala
if (mouse_click && pode_clicar) {
    fala_atual += 1;

    if (fala_atual >= array_length(falas)) {
        room_goto(ROOM_INICIAL); // Última fala → muda de room
    } else {
        texto_completo = falas[fala_atual];
        texto_mostrado = "";
        terminou_fala = false;
        typing_timer = 0;
        pos_texto = 1; // reinicia contador para nova fala
    }

    // Bloqueia até o botão ser liberado de novo
    pode_clicar = false;
}

}
