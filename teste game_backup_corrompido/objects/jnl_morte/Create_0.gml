// --- Posições centrais (não muda) ---
cx = 576 / 2;
cy = 960 / 2;
mx = 0
my = 0

// --- Frases do dev (traduzidas) ---
var frases; // Declara a variável

// Switch principal para selecionar o idioma e definir o array de frases
switch (global.language) {
    
    // --- LÍNGUA INGLESA ---
    case 1:
        frases = [
            "Lost again? I'll make it easy for you.",
            "Wow... what a disaster, congratulations!",
            "Never bet it all on bla...",
            "The only thing faster than you dying is a lawsuit from BIG N.",
            "Look... even my dog could play better than that.",
            "Don't worry, nobody expected much from you anyway.",
            "Was that your attempt?",
            "If losing were an art, you'd be Picasso.",
            "Congratulations, you managed to fail in record time.",
            "Did you actually play or did you just come here to lose?",
            "Seriously, is that the best you can do?",
            "Losing like that is a rare talent... unfortunately.",
            "I almost feel sorry for you... but I'm laughing too hard.",
            "I'll call that the epic fail of the day.",
            "Maybe you should try another hobby... like knitting.",
            "That record deserves an award... for failure.",
            "Look... not even my fingerless grandpa would do worse.",
            "You lost again? Impressive... how bad you are.",
            "If losing were a profession, you'd be a millionaire.",
            "Once again... and the legend of failure continues.",
            "Don't worry, every defeat just increases your... baldness."
        ];
        break;
        
    // --- LÍNGUA ALEMÃ ---
    case 2:
        frases = [
            "Schon wieder verloren? Ich mach's dir einfach.",
            "Wow... was für eine Katastrophe, herzlichen Glückwunsch!",
            "Setze niemals alles auf Sch...",
            "Das Einzige, was schneller ist als dein Tod, ist eine Klage von BIG N.",
            "Schau... sogar mein Hund könnte besser spielen.",
            "Keine Sorge, niemand hat viel von dir erwartet.",
            "War das dein Versuch?",
            "Wenn Verlieren eine Kunst wäre, wärst du Picasso.",
            "Glückwunsch, du hast es geschafft, in Rekordzeit zu versagen.",
            "Hast du gespielt oder bist du nur zum Verlieren hergekommen?",
            "Im Ernst, ist das das Beste, was du kannst?",
            "So zu verlieren ist ein seltenes Talent... leider.",
            "Du tust mir fast leid... aber ich lache zu sehr.",
            "Ich nenne das den epischen Fehlschlag des Tages.",
            "Vielleicht solltest du ein anderes Hobby ausprobieren... wie Stricken.",
            "Dieser Rekord verdient eine Auszeichnung... für Versagen.",
            "Schau... nicht einmal mein fingerloser Opa würde es schlechter machen.",
            "Schon wieder verloren? Beeindruckend... wie schlecht du bist.",
            "Wenn Verlieren ein Beruf wäre, wärst du Millionär.",
            "Noch einmal... und die Legende des Versagens geht weiter.",
            "Keine Sorge, jede Niederlage vergrößert nur deine... Glatze."
        ];
        break;
        
    // --- LÍNGUA PORTUGUESA (Padrão) ---
    default:
        frases = [
            "Perdeu de novo? vou deixar fácil pra você",
            "Uau... que desastre, parabéns!",
            "Nunca aposte tudo no pre...",
            "Mais rápido que você morrer, só um processo da BIG N",
            "Olha... até meu cachorro jogando poderia fazer melhor.",
            "Não se preocupe, ninguém esperava muito de você.",
            "Isso foi sua tentativa ?",
            "Se perder fosse arte, você seria Picasso.",
            "Parabéns, conseguiu falhar em tempo recorde.",
            "Você jogou ou só veio aqui pra perder mesmo?",
            "Sério que isso é o melhor que consegue?",
            "Perder assim é um talento raro... infelizmente.",
            "Fiquei até com dó... mas tô rindo muito.",
            "Vou chamar isso de derrota épica do dia.",
            "Talvez você devesse tentar outro hobby... tipo tricô.",
            "Esse recorde merece um prêmio... de fracasso.",
            "Olha... nem meu avô sem dedos faria pior.",
            "Você perdeu de novo? Impressionante... de tão ruim.",
            "Se perder fosse profissão, você estaria milionário.",
            "Mais uma vez... e a lenda do fracasso continua.",
            "Não se preocupe, cada derrota só aumenta sua... calvice."
        ];
        break;
}

// --- O resto do código funciona com o array 'frases' já traduzido ---

// --- Sorteia uma frase ---
frase_atual = frases[irandom(array_length(frases)-1)];
frase_completa = "";
frase_index = 0;

// --- Velocidade da digitação ---
dig_speed = 3; // maior = mais devagar
dig_timer = 0;

// --- Largura máxima para quebra de linha ---
max_width = 576 - 100; // margem de 50px