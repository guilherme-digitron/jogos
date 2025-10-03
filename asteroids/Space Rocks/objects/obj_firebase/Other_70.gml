// No Evento Async - Social do seu objeto de controle

// Primeiro, vamos ver o que recebemos para depuração
show_debug_message("Conteúdo do async_load: " + json_encode(async_load));

// Verificamos se a chave "documents" existe no DS Map principal
if (ds_map_exists(async_load, "documents")) {
    
    var root_map = async_load;
    var documents_list_id = ds_map_find_value(root_map, "documents");
    
    // Limpa a lista de scores antiga
    global.leaderboard_scores = [];

    var list_size = ds_list_size(documents_list_id);
    for (var i = 0; i < list_size; i++) {
        // Cada item na lista é um DS Map representando um documento
        var document_map = ds_list_find_value(documents_list_id, i);
        
        // Dentro do documento, os dados estão em outro DS Map na chave "fields"
        var fields_map = ds_map_find_value(document_map, "fields");
        
        // Pegamos o mapa do campo "name"
        var name_map = ds_map_find_value(fields_map, "name");
        // E extraímos o valor de "stringValue"
        var player_name = ds_map_find_value(name_map, "stringValue");
        
        // Fazemos o mesmo para o campo "score"
        var score_map = ds_map_find_value(fields_map, "score");
        // E extraímos o valor de "integerValue"
        var player_score = real(ds_map_find_value(score_map, "integerValue"));
        
        // Adiciona os dados ao nosso array global
        array_push(global.leaderboard_scores, { name: player_name, score: player_score });
        
        show_debug_message("Lido do DB: " + player_name + " - " + string(player_score));
    }
    show_debug_message("Leaderboard carregado com sucesso!");
}
else if (ds_map_exists(async_load, "error")) {
    show_debug_message("ERRO retornado pelo Firebase: " + json_encode(async_load));
}