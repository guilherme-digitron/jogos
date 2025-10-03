/// @function scr_fetch_leaderboard()
/// @description Inicia o pedido para buscar os 10 melhores scores.

function scr_fetch_leaderboard() {
    show_debug_message("Buscando dados do leaderboard com a API correta...");

    // Pega a constante para ordenação descendente (do maior para o menor)
    // que está definida na sua extensão.
    var _sort_desc = FIREBASE_FIRESTORE_QUERY_SORT.DESC;

    // Constrói a consulta:
    // 1. FirebaseFirestore("leaderboard") -> Aponta para a coleção
    // 2. .OrderBy("score", _sort_desc)  -> Ordena pelo campo "score" em ordem decrescente
    // 3. .Limit(10)                     -> Pega no máximo 10 resultados
    // 4. .Query()                       -> Executa a consulta
    FirebaseFirestore("leaderboard").OrderBy("score", _sort_desc).Limit(10).Query();
	
    show_debug_message("Requisição de busca de scores enviada.");
}