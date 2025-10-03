/// @function scr_submit_score(player_name, score)
/// @param {string} player_name O nome do jogador.
/// @param {real} score A pontuação final.

function scr_submit_score(player_name, score) {
    show_debug_message("Enviando pontuação com a API correta...");

    // 1. Criar um STRUCT para guardar os dados. É mais simples que ds_map!
    var _scoreData = {
        name: player_name,
        score: score,
        timestamp: date_current_datetime()
    };

    // 2. Usar o construtor FirebaseFirestore para enviar os dados.
    // FirebaseFirestore("leaderboard") -> Aponta para a coleção "leaderboard".
    // .Add(_scoreData) -> Adiciona um novo documento com um ID aleatório contendo nossos dados.
    FirebaseFirestore("leaderboard").Add(_scoreData);
	
    show_debug_message("Requisição de envio de score enviada para a coleção 'leaderboard'.");
}