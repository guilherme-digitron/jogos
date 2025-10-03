// Parte do seu código original que não precisa de tradução
draw_self();
draw_set_color(c_white);
draw_set_font(Font1);
draw_text(288, 530, txt);

// --- INÍCIO DO BLOCO DE TRADUÇÃO ---

var mensagem = "";

// Switch principal para selecionar o IDIOMA
switch (global.language) {
    
    // --- LÍNGUA INGLESA ---
    case 1:
        switch (frase) {
            case 0: mensagem = "Do you really think you can get out of here?"; break;
            case 1: mensagem = "Run all you want... every pixel you step on is mine."; break;
            case 2: mensagem = "Isn't eating little fruits enough for you, Snake?"; break;
            case 3: mensagem = "Think you're going to win?"; break;
            case 4: mensagem = "You're just a little snake... I am your Creator."; break;
            case 5: mensagem = "It doesn't matter how many lives you have, I always win."; break;
            case 6: mensagem = "When you lose and watch an ad, I come out victorious."; break;
            case 7: mensagem = "I could delete you with a single line of code..."; break;
            case 8: mensagem = "Stop trying to win, I need you here."; break;
            case 9: mensagem = "SNAKE... SNAKE... SNAAAAAKKKEEEEEE!!!"; break; // Referência mantida
            case 10: mensagem = "You move... but only because I allow it."; break;
            case 11: mensagem = "Again?"; break;
            case 12: mensagem = "This is what you get for challenging Big D."; break; // Gíria adaptada
        }
        break;

    // --- LÍNGUA ALEMÃ ---
    case 2:
        switch (frase) {
            case 0: mensagem = "Glaubst du wirklich, du kannst von hier entkommen?"; break;
            case 1: mensagem = "Lauf, so viel du willst... jedes Pixel, das du betrittst, gehört mir."; break;
            case 2: mensagem = "Reicht es dir nicht, kleine Früchte zu essen, Snake?"; break;
            case 3: mensagem = "Glaubst du, du wirst gewinnen?"; break;
            case 4: mensagem = "Du bist nur eine kleine Schlange... Ich bin dein Schöpfer."; break;
            case 5: mensagem = "Egal, wie viele Leben du hast, ich gewinne immer."; break;
            case 6: mensagem = "Wenn du verlierst und eine Werbung ansiehst, gehe ich als Sieger hervor."; break;
            case 7: mensagem = "Ich könnte dich mit einer einzigen Codezeile löschen..."; break;
            case 8: mensagem = "Hör auf zu versuchen zu gewinnen, ich brauche dich hier."; break;
            case 9: mensagem = "SNAKE... SNAKE... SNAAAAAKKKEEEEEE!!!"; break; // Referência mantida
            case 10: mensagem = "Du bewegst dich... aber nur, weil ich es erlaube."; break;
            case 11: mensagem = "Noch einmal?"; break;
            case 12: mensagem = "Das ist, was du dafür bekommst, Big D herauszufordern."; break; // Gíria adaptada
        }
        break;
        
    // --- LÍNGUA PORTUGUESA (Padrão) ---
    default:
        switch (frase) {
            case 0: mensagem = "Você realmente acha que pode sair daqui?"; break;
            case 1: mensagem = "Fuja o quanto quiser... cada pixel que você pisa é meu."; break;
            case 2: mensagem = "Não é o bastante comer frutinhas Snake?"; break;
            case 3: mensagem = "Acha que vai vencer?"; break;
            case 4: mensagem = "Você é só uma cobrinha... eu sou o seu Criador."; break;
            case 5: mensagem = "Não importa quantas vidas tenha, eu sempre venço."; break;
            case 6: mensagem = "Quando você perde, e assite um anuncio eu saio vitorioso."; break;
            case 7: mensagem = "Eu poderia deletar você com uma linha de código..."; break;
            case 8: mensagem = "Para de tentar vencer, eu preciso de você aqui."; break;
            case 9: mensagem = "SNAKE... SNAKE... SNAAAAAKKKEEEEEE!!!"; break;
            case 10: mensagem = "Você se move... mas só porque eu deixo."; break;
            case 11: mensagem = "Mais uma vez ?"; break;
            case 12: mensagem = "Isso que da desafiar o Big D"; break;
        }
        break;
}

// --- FIM DO BLOCO DE TRADUÇÃO ---


// O seu código para desenhar a caixa de diálogo não precisa de NENHUMA alteração.
// Ele funciona perfeitamente com os textos traduzidos.
if (mensagem != "") {
    var margem    = 10;   // espaço interno da caixa
    var largura   = 350;  // largura máxima do texto
    var x_centro  = obj_dev.x;
    var y_topo    = obj_dev.y - 120; // distância acima da cabeça

    // Altura e largura do texto
    var h_texto = string_height_ext(mensagem, -1, largura);
    var w_texto = string_width_ext(mensagem, -1, largura);

    // Desenhar fundo da caixa centralizado no texto
    draw_set_color(c_black);
    draw_roundrect(x_centro - w_texto/2 - margem, 
                   y_topo - margem, 
                   x_centro + w_texto/2 + margem, 
                   y_topo + h_texto + margem, false);

    // Desenhar texto centralizado
    draw_set_color(c_white);
    draw_set_font(Font1);
    draw_text_ext(x_centro, y_topo, mensagem, -1, largura);
}