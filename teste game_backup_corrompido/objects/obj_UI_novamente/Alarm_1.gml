// 1. Define os textos base de acordo com o idioma
var base_text = "Carregando";
var loaded_text = "Carregado";
var returning_text = "Voltando";

switch (global.language) {
    case 1: // English
        base_text = "Loading";
        loaded_text = "Loaded";
        returning_text = "Returning";
        break;
        
    case 2: // German
        base_text = "Wird geladen";
        loaded_text = "Geladen";
        returning_text = "Zurück";
        break;
}

// 2. Atualiza o texto 'txt' com base na etapa (loading_step)
switch (loading_step) {
    case 0:
        txt = base_text;
        break;
    case 1:
        txt = base_text + ".";
        break;
    case 2:
        txt = base_text + "..";
        break;
    case 3:
        txt = base_text + "...";
        break;
    case 4:
        txt = loaded_text;
        break;
    case 5:
        txt = returning_text;
        finalizar = 1;
        break;
}

// 3. Avança para a próxima etapa e reinicia o alarme (se a animação não acabou)
if (loading_step <= 5) {
    loading_step += 1;
    alarm[1] = 60; // Define o alarme para 1 segundo (a 60 FPS)
}