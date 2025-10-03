// --- Início do Evento Create ---

// 1. Define o array menu_inicial com base no idioma
switch (global.language) {
    case 1: // Inglês
        menu_inicial = ["STORY", "PLAY", "OPTIONS", "CREDITS", "EXIT"];
        break;
        
    case 2: // Alemão
        menu_inicial = ["GESCHICHTE", "SPIELEN", "OPTIONEN", "MITWIRKENDE", "BEENDEN"];
        break;
        
    default: // Português (Padrão para case 0 ou qualquer outro valor)
        menu_inicial = ["HISTÓRIA", "JOGAR", "OPÇÕES", "CRÉDITOS", "SAIR"];
        break;
}

// 2. Inicializa as outras variáveis do menu
tocar = 0;
opcao_anterior = -1;

// 3. Inicializa o array 'escala' corretamente
// O array 'escala' deve ter o mesmo tamanho do array 'menu_inicial'
// Este loop garante que cada opção do menu comece com escala 1.
escala = []; // Opcional, mas boa prática declarar como array
for (var i = 0; i < array_length(menu_inicial); i++) {
    escala[i] = 1;
}

// --- Fim do Evento Create ---