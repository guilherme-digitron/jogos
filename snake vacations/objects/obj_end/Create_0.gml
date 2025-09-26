// --- Seleciona o array de falas com base no idioma global ---
// Usamos uma única variável "falas" que recebe o conteúdo do idioma correto.

switch (global.language) {
    case 0: // Português
        falas = [
            "...",
            "Então é isso... você conseguiu <rainbow>1000 pontos</rainbow>",
            "Este é o meu primeiro <rainbow>jogo</rainbow> que virou realidade, não posso deixar de me orgulhar.",
            "Fiz questão de torná-lo <rainbow>impossível</rainbow> só pra você ficar o máximo de tempo aqui.",
            "Sempre quis criar um <rainbow>jogo</rainbow> sabe?",
            "Sempre quis <rainbow>divertir</rainbow> os outros, do jeito que eu mesmo me divertia.",
            "Vocês vão ver nos <rainbow>créditos</rainbow> mas este <rainbow>jogo</rainbow> não teria sido possível sem meus fiéis <rainbow>amigos</rainbow>.",
            "Agradeço em especial ao <rainbow>Murilo</rainbow> e ao <rainbow>Fuzikawa</rainbow> vocês são incríveis, rapazes.",
            "Correndo o risco de parecer meio <rainbow>colorido</rainbow> ouso dizer que <rainbow>amo</rainbow> vocês.",
            "Amo você também, player.",
            "Graças a você que chegou até aqui, posso me orgulhar de ser um <rainbow>dev nerdola</rainbow>.",
            "Graças aos <rainbow>anúncios</rainbow> que viu, posso desembolsar uma <rainbow>graninha</rainbow> também.",
            "Parte será doada para a <rainbow>educação</rainbow> no Brasil,",
            "O resto vai para minha <rainbow>aposentadoria</rainbow>.",
            "O INSS é complicado, amigos.",
            "Enfim, obrigado por jogar my friend.",
            "Tenha uma <rainbow>excelente vida</rainbow>.",
            "Não se esqueça de preenchê-la com <rainbow>amigos</rainbow> <rainbow>família</rainbow> e <rainbow>fé</rainbow>",
            "<rainbow>Gutes Leben</rainbow>",
            "<rainbow>O Snake está de férias inclusive</rainbow>"
        ];
        break;

    case 1: // English
        falas = [
            "...",
            "So that's it... you got <rainbow>1000 points</rainbow>",
            "This is my first <rainbow>game</rainbow> to become a reality, I can't help but be proud.",
            "I made sure to make it <rainbow>impossible</rainbow> just so you would stay here as long as possible.",
            "I always wanted to create a <rainbow>game</rainbow>, you know?",
            "I always wanted to <rainbow>entertain</rainbow> others, the same way I had fun myself.",
            "You'll see it in the <rainbow>credits</rainbow>, but this <rainbow>game</rainbow> wouldn't have been possible without my loyal <rainbow>friends</rainbow>.",
            "I especially thank <rainbow>Murilo</rainbow> and <rainbow>Fuzikawa</rainbow>, you guys are incredible.",
            "At the risk of sounding a bit <rainbow>cheesy</rainbow>, I dare say that I <rainbow>love</rainbow> you guys.",
            "I love you too, player.",
            "Thanks to you for making it this far, I can be proud of being a <rainbow>nerdy dev</rainbow>.",
            "Thanks to the <rainbow>ads</rainbow> you watched, I can also make a bit of <rainbow>cash</rainbow>.",
            "Part of it will be donated to <rainbow>education</rainbow> in Brazil,",
            "The rest will go to my <rainbow>retirement</rainbow>.",
            "Social security is complicated, my friends.",
            "Anyway, thanks for playing, my friend.",
            "Have an <rainbow>excellent life</rainbow>.",
            "Don't forget to fill it with <rainbow>friends</rainbow>, <rainbow>family</rainbow>, and <rainbow>faith</rainbow>",
            "<rainbow>Gutes Leben</rainbow>",
            "<rainbow>Snake is on vacation, by the way</rainbow>"
        ];
        break;

    case 2: // Deutsch (Alemão)
        falas = [
            "...",
            "Das war's also... du hast <rainbow>1000 Punkte</rainbow> erreicht.",
            "Das ist mein erstes <rainbow>Spiel</rainbow>, das Wirklichkeit wurde. Ich kann nicht anders, als stolz zu sein.",
            "Ich habe es absichtlich <rainbow>unmöglich</rainbow> gemacht, damit du so lange wie möglich hier bleibst.",
            "Ich wollte schon immer ein <rainbow>Spiel</rainbow> entwickeln, weißt du?",
            "Ich wollte schon immer andere <rainbow>unterhalten</rainbow>, so wie ich selbst Spaß hatte.",
            "Ihr werdet es in den <rainbow>Credits</rainbow> sehen, aber dieses <rainbow>Spiel</rainbow> wäre ohne meine treuen <rainbow>Freunde</rainbow> nicht möglich gewesen.",
            "Ich danke besonders <rainbow>Murilo</trib> und <rainbow>Fuzikawa</rainbow>, ihr seid unglaublich, Leute.",
            "Auf die Gefahr hin, ein bisschen <rainbow>kitschig</rainbow> zu klingen, wage ich zu sagen, dass ich euch <rainbow>liebe</rainbow>.",
            "Ich liebe dich auch, Spieler.",
            "Dank dir, der es bis hierher geschafft hat, kann ich stolz darauf sein, ein <rainbow>nerdiger Entwickler</rainbow> zu sein.",
            "Dank der <rainbow>Werbung</rainbow>, die du gesehen hast, kann ich auch etwas <rainbow>Kohle</rainbow> verdienen.",
            "Ein Teil davon wird für die <rainbow>Bildung</rainbow> in Brasilien gespendet,",
            "Der Rest geht in meine <rainbow>Rente</rainbow>.",
            "Die Rente ist kompliziert, Freunde.",
            "Wie auch immer, danke fürs Spielen, mein Freund.",
            "Hab ein <rainbow>ausgezeichnetes Leben</rainbow>.",
            "Vergiss nicht, es mit <rainbow>Freunden</rainbow>, <rainbow>Familie</rainbow> und <rainbow>Glauben</rainbow> zu füllen.",
            "<rainbow>Gutes Leben</trib>",
            "<rainbow>Snake ist übrigens im Urlaub</rainbow>"
        ];
        break;

    default: // Fallback para inglês
        falas = [ "ERROR: Language not found." ];
        break;
}

// --- Restante das suas variáveis de controle ---
mouse_held = 0;
fala_atual = 0;
texto_completo = falas[fala_atual];
texto_mostrado = "";
typing_speed = 2;
typing_timer = 0;
terminou_fala = false;
pode_clicar = false;
global.historia = 0;
pos_texto = 1;