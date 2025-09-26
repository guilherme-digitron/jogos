/// Chame no Game Start / Create do controlador
function record_load() {
    // garante existência
    if !variable_global_exists("record") global.record = 0;

    if file_exists("save.ini") {
        ini_open("save.ini");
        global.record = ini_read_real("GameData", "Highscore", 0);
        ini_close();
    } else {
        global.record = 0;
    }
}
