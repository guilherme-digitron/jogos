// Variáveis de controle do menu para mobile
hover_option = -1; // -1 = nada, 0 = Continuar, 1 = Menu Inicial

// Efeito de escala do botão
button_scale = [1, 1];
base_scale = 1;
selected_scale = 1.2;

// Margem para o texto da frase (em pixels)
margin = 64;

// Frase aleatória
random_phrase_index = irandom(9);

// --- Traduções (mesmo código de antes) ---

// Frases de ridicularização
phrases = [
    // Português (global.language == 0)
    [
        "Precisou de uma pausa para respirar, é?",
        "O jogo é muito difícil ou você que é fraco?",
        "Pausar não vai te salvar para sempre.",
        "Ah, o famoso 'pause estratégico'. Sei.",
        "Cansou tão rápido? Que decepção.",
        "O mundo não para só porque você pausou.",
        "Até minha avó joga sem pausar.",
        "Temos um campeão... em apertar pause.",
        "A covardia tem um botão e você o encontrou.",
        "Espero que essa pausa seja para repensar suas habilidades."
    ],
    // Inglês (global.language == 1)
    [
        "Needed a breather, huh?",
        "Is the game too hard, or are you just weak?",
        "Pausing won't save you forever.",
        "Ah, the famous 'strategic pause'. Right.",
        "Tired already? What a disappointment.",
        "The world doesn't stop just because you paused.",
        "Even my grandma plays without pausing.",
        "We have a champion... at pressing pause.",
        "Cowardice has a button, and you found it.",
        "I hope this pause is to rethink your skills."
    ],
    // Alemão (global.language == 2)
    [
        "Brauchst du eine Verschnaufpause, was?",
        "Ist das Spiel zu schwer oder bist du nur schwach?",
        "Pausieren wird dich nicht ewig retten.",
        "Ah, die berühmte 'strategische Pause'. Klar.",
        "Schon müde? Was für eine Enttäuschung.",
        "Die Welt hält nicht an, nur weil du pausiert hast.",
        "Sogar meine Oma spielt ohne Pause.",
        "Wir haben einen Champion... im Pausendrücken.",
        "Feigheit hat einen Knopf, und du hast ihn gefunden.",
        "Ich hoffe, diese Pause dient dazu, deine Fähigkeiten zu überdenken."
    ]
];

// Textos dos botões
button_text = [
    // Português
    ["Continuar", "Menu Inicial"],
    // Inglês
    ["Continue", "Main Menu"],
    // Alemão
    ["Fortsetzen", "Hauptmenü"]
];

// Seleciona a frase e os textos com base no idioma
current_phrase = phrases[global.language][random_phrase_index];
continue_button_text = button_text[global.language][0];
main_menu_button_text = button_text[global.language][1];
sfx = 0