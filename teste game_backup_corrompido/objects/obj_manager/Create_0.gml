// Evento Create do obj_manager

// --- INICIALIZAÇÃO ÚNICA (RODA APENAS UMA VEZ POR SESSÃO) ---

// Este bloco garante que as variáveis globais só sejam criadas uma vez.
if (!variable_global_exists("game_initialized")) {
    global.game_initialized = true; // Trava para não rodar de novo
    
    show_debug_message("Jogo inicializado pela primeira vez. Definindo configurações padrão.");
    
    // Define os valores padrão das configurações
    global.language       = 0; // 0: PT, 1: EN, 2: DE
    global.master_volume  = 100;
    global.sfx_volume     = 100;
    
    // Carrega as configurações salvas, que irão sobrescrever os padrões se existirem.
    load_settings();
}


// --- FUNÇÕES DE GERENCIAMENTO ---

// Função para CARREGAR as configurações do arquivo .ini
function load_settings() {
    ini_open("settings.ini");
    global.language       = ini_read_real("Settings", "Language", global.language);
    global.master_volume  = ini_read_real("Settings", "MasterVolume", global.master_volume);
    global.sfx_volume     = ini_read_real("Settings", "SFXVolume", global.sfx_volume);
    ini_close();
    
    // Aplica o volume carregado
    audio_master_gain(global.master_volume / 100);
    show_debug_message("Configurações Carregadas!");
}

// Função para SALVAR as configurações no arquivo .ini
function save_settings() {
    ini_open("settings.ini");
    ini_write_real("Settings", "Language", global.language);
    ini_write_real("Settings", "MasterVolume", global.master_volume);
    ini_write_real("Settings", "SFXVolume", global.sfx_volume);
    ini_close();
    
    show_debug_message("Configurações Salvas!");
}