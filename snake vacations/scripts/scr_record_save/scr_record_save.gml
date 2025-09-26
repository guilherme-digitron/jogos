/// Chame quando o jogo terminar (ou quando bater recorde)
function record_save(current_score) {
    if current_score > global.record {
        global.record = current_score;
        ini_open("save.ini");
        ini_write_real("GameData", "Highscore", global.record);
        ini_close();
    }
}
