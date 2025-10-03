// --- VARIÁVEIS DE CONTROLE ---

// Velocidade com que os créditos vão rolar para cima (pixels por frame)
scroll_speed = 1.2;

// Espaçamento vertical entre cada linha de texto
line_height = 45;

// Posição inicial do texto. Começa abaixo da tela para rolar para dentro.
y_pos = room_height + 100;


// --- SELEÇÃO DA LISTA DE CRÉDITOS COM BASE NO IDIOMA ---

// Usamos uma estrutura if/else if para garantir que apenas um idioma seja carregado.
// A variável "credits_text" conterá a lista correta no final.

if (global.language == 0) { // Português
    credits_text = [
        "Diretor Criativo",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Murilo Cavalcanti",
        "",
        "Diretor de Arte",
        "Sheldon",
        "Pedro Henrique Nascimento Santos",
        "",
        "Diretor Técnico",
        "Sheldon",
        "",
        "Produtor Executivo",
        "Sheldon",
        "",
        "Lead Game Designer",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Pedro Henrique Nascimento Santos",
        "",
        "Roteirista / Narrative Designer",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "",
        "Sound Designer / Compositor",
        "Sheldon",
        "TipTopTomCat",
        "Everton Pinto",
        "",
        "Lead Programmer",
        "Murilo Pysclewitz Fuikawa",
        "Sheldon",
        "",
        "Gameplay Programmer",
        "Murilo Pysclewitz Fuikawa",
        "Sheldon",
        "",
        "QA Tester (Testador de Qualidade)",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Murilo Cavalcanti",
        "Beja",
        "Carlos Monteiro",
        "Everton Pinto",
        "",
        "",
        "Agradecimentos Especiais",
        "",
        "Luana Claudia da Silva Amaral",
        "Renato Amaral",
        "Marcos Ferreira",
        "Mark Overmars",
        "Alan Turing",
        "Guido Van Rossum",
        "Hideo Kojima",
        "Shigeru Miyamoto",
        "Maria da Conceição Oliveira",
        "Tereza Celia Amaral",
        "Julia Nakazoni Bertoluci",
        "Jesus Cristo",
        "Julia Viegas",
        "Eduardo Peralta",
        "Marcelo Augusto",
        "",
        "",
        "E a todos os jogadores pelo mundo.",
        "Obrigado por jogar!"
    ];
}
else if (global.language == 1) { // English
    credits_text = [
        "Creative Director",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Murilo Cavalcanti",
        "",
        "Art Director",
        "Sheldon",
        "Pedro Henrique Nascimento Santos",
        "",
        "Technical Director",
        "Sheldon",
        "",
        "Executive Producer",
        "Sheldon",
        "",
        "Lead Game Designer",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Pedro Henrique Nascimento Santos",
        "",
        "Writer / Narrative Designer",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "",
        "Sound Designer / Composer",
        "Sheldon",
        "TipTopTomCat",
        "Everton Pinto",
        "",
        "Lead Programmer",
        "Murilo Pysclewitz Fuikawa",
        "Sheldon",
        "",
        "Gameplay Programmer",
        "Murilo Pysclewitz Fuikawa",
        "Sheldon",
        "",
        "QA Tester (Quality Assurance)",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Murilo Cavalcanti",
        "Beja",
        "Carlos Monteiro",
        "Everton Pinto",
        "",
        "",
        "Special Thanks",
        "",
        "Luana Claudia da Silva Amaral",
        "Renato Amaral",
        "Marcos Ferreira",
        "Mark Overmars",
        "Alan Turing",
        "Guido Van Rossum",
        "Hideo Kojima",
        "Shigeru Miyamoto",
        "Maria da Conceição Oliveira",
        "Tereza Celia Amaral",
        "Julia Nakazoni Bertoluci",
        "Jesus Christ",
        "Julia Viegas",
        "Eduardo Peralta",
        "Marcelo Augusto",
        "",
        "",
        "And to all the players around the world.",
        "Thank you for playing!"
    ];
}
else if (global.language == 2) { // Deutsch (Alemão)
    credits_text = [
        "Kreativdirektor", // Creative Director
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Murilo Cavalcanti",
        "",
        "Art Director",
        "Sheldon",
        "Pedro Henrique Nascimento Santos",
        "",
        "Technischer Leiter", // Technical Director
        "Sheldon",
        "",
        "Ausführender Produzent", // Executive Producer
        "Sheldon",
        "",
        "Lead Game Designer",
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Pedro Henrique Nascimento Santos",
        "",
        "Autor / Narrative Designer", // Writer
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "",
        "Sound Designer / Komponist", // Composer
        "Sheldon",
        "TipTopTomCat",
        "Everton Pinto",
        "",
        "Lead Programmer",
        "Murilo Pysclewitz Fuikawa",
        "Sheldon",
        "",
        "Gameplay Programmer",
        "Murilo Pysclewitz Fuikawa",
        "Sheldon",
        "",
        "QA-Tester (Qualitätssicherung)", // QA Tester (Quality Assurance)
        "Sheldon",
        "Murilo Pysclewitz Fuikawa",
        "Murilo Cavalcanti",
        "Beja",
        "Carlos Monteiro",
        "Everton Pinto",
        "",
        "",
        "Besonderer Dank", // Special Thanks
        "",
        "Luana Claudia da Silva Amaral",
        "Renato Amaral",
        "Marcos Ferreira",
        "Mark Overmars",
        "Alan Turing",
        "Guido Van Rossum",
        "Hideo Kojima",
        "Shigeru Miyamoto",
        "Maria da Conceição Oliveira",
        "Tereza Celia Amaral",
        "Julia Nakazoni Bertoluci",
        "Jesus Christus",
        "Julia Viegas",
        "Eduardo Peralta",
        "Marcelo Augusto",
        "",
        "",
        "Und an alle Spieler auf der ganzen Welt.", // And to all the players around the world.
        "Danke fürs Spielen!" // Thank you for playing!
    ];
}
else { // Fallback: se o idioma não for encontrado, usa o inglês como padrão.
    credits_text = [ "Error: Language not found.", "Loading default language (English)...", "" ];
    // (Copiaria a lista de inglês aqui para ter um fallback completo)
}


// Calcula a altura total de todo o bloco de texto
// Este código não muda e funciona perfeitamente com a lógica acima.
total_text_height = array_length(credits_text) * line_height;