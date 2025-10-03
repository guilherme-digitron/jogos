// Primeiro, definimos as variáveis de texto com base no idioma
var text_score = "Pontos: ";
var text_record = "Record: ";
var text_life = "Vidas: "; // Corrigido do original "Life:" para ser consistente em português


// Usamos um switch para selecionar o idioma
switch (global.language) {
    // case 0: // Português (já é o padrão acima, não precisa de case)
    
    case 1: // Inglês
        text_score = "Score: ";
        text_record = "Highscore: ";
        text_life = "Life: ";
        break;
        
    case 3: // Alemão
        text_score = "Punkte: ";
        text_record = "Rekord: ";
        text_life = "Leben: ";
        break;
}


// Agora, o código para desenhar o texto, usando as variáveis
if (global.cont > 0) {
    if (global.morte == 0) {
    
        draw_set_color(c_white);
        draw_set_font(Font1);

        // Desenha a pontuação
        draw_text(40, 40, text_score + string(global.cont));
    
        // Desenha o recorde
        draw_text(40, 80, text_record + string(global.record));
    
        // Desenha a vida
        draw_text(40, 120, text_life + string(global.life));
        
    }
}