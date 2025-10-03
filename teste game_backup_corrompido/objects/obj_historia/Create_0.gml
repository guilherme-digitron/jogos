if global.language == 0 {
falas = [
    "Finalmente",
    "Após anos de trabalho duro, após anos dando tudo de mim atrás dessas <wave>maçãs</wave>",
    "Finalmente vou poder descansar",
    "Chegou a hora de me aposentar",
    "Comprar uma <wave>casa</wave> na <wave>praia</wave>",
    "Tomar um bronze",
    "Escrever uma biografia, acho que vão gostar de ouvir os <wave>podres</wave> que tenho da <wave>Nokia</wave>",
    "Talvez eu até tenha tempo para sair com a <wave>Laura</wave>",
    "Ela sempre reclama que eu trabalho demais",
    "Enfim, o fim chegou para esse trabalho ingrato...",
    // Falas do Dev (boss)
    "Você achou mesmo que seu trabalho ia acabar?",
    "Eu jamais vou te libertar.",
    "Você é meu Snake, eu o criei.",
    "Eu sou seu dono.",
    "Enquanto você viver...",
    "Na verdade enquanto as pessoas jogarem",
    "E verem anúncios para ressuscitar",
    "Só para morrerem novamente.",
    "HAHHAHAHAHAHAHAHAHHAHAHA",
    // Cobra
    "VEREMOS SENHOR BIG N"
];
}

// --- Falas do cutscene ---

if global.language == 1 {
// --- ENGLISH ---
falas = [
    "Finally",
    "After years of hard work, after years of giving my all for these <wave>apples</wave>",
    "I'll finally be able to rest",
    "The time has come to retire",
    "Buy a <wave>house</wave> on the <wave>beach</wave>",
    "Get a tan",
    "Write a biography, I think they'll enjoy hearing the <wave>dirt</wave> I have on <wave>Nokia</wave>",
    "Maybe I'll even have time to go out with <wave>Laura</wave>",
    "She always complains that I work too much",
    "Anyway, the end has come for this thankless job...",
    // Dev's (boss) lines
    "Did you really think your work was over?",
    "I will never set you free.",
    "You are my Snake, I created you.",
    "I am your owner.",
    "As long as you live...",
    "Actually, as long as people keep playing",
    "And watching ads to revive",
    "Just to die again.",
    "HAHHAHAHAHAHAHAHAHHAHAHA",
    // Snake
    "WE'LL SEE, MISTER BIG N"
];
}

// --- Falas do cutscene ---

if global.language == 2 {
// --- DEUTSCH (ALEMÃO) ---
falas = [
    "Endlich",
    "Nach Jahren harter Arbeit, nachdem ich Jahre lang alles für diese <wave>Äpfel</wave> gegeben habe",
    "Endlich werde ich mich ausruhen können",
    "Es ist Zeit, in Rente zu gehen",
    "Ein <wave>Haus</wave> am <wave>Strand</wave> kaufen",
    "Mich sonnen",
    "Eine Biografie schreiben, ich glaube, die Leute werden es mögen, den <wave>Dreck</wave> zu hören, den ich über <wave>Nokia</wave> habe",
    "Vielleicht habe ich sogar Zeit, mit <wave>Laura</wave> auszugehen",
    "Sie beschwert sich immer, dass ich zu viel arbeite",
    "Naja, das Ende ist für diesen undankbaren Job gekommen...",
    // Entwickler (Boss) Sätze
    "Dachtest du wirklich, deine Arbeit sei vorbei?",
    "Ich werde dich niemals freilassen.",
    "Du bist meine Schlange, ich habe dich erschaffen.",
    "Ich bin dein Besitzer.",
    "Solange du lebst...",
    "Eigentlich, solange die Leute weiterspielen",
    "Und Werbung schauen, um wiederbelebt zu werden",
    "Nur um wieder zu sterben.",
    "HAHHAHAHAHAHAHAHAHHAHAHA",
    // Schlange
    "DAS WERDEN WIR SEHEN, HERR BIG N"
];
}

global.historia = 0
// --- Controle da fala ---
fala_atual = 0;
shown_chars = 0;
typing_speed = 2; // frames por caractere
typing_timer = 0;
terminou_fala = false;
texto_mostrado = "";
pode_clicar = true;
tocar = 0

// --- Variáveis de efeito ---
boss = 0;           // ativo quando fala do Dev
fonte_falas = Font1; // fonte do texto

// --- Controle da história ---
historia = 0;       // vai ficar = 1 quando a cutscene terminar
mostrado = false;   // se quiser usar para controlar exibição

som_fala_id = noone;  
som_tocando = false; 