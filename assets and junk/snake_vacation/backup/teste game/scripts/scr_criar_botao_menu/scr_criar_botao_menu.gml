function scr_criar_botao_menu(){
/// criar_botao(texto, pos_y, room_destino)

/// @param texto           Texto que aparecerá no botão
/// @param pos_y           Posição Y do botão
/// @param room_destino    Room de destino (ou noone para ações customizadas)

var texto = argument0;
var pos_y = argument1;
var destino = argument2;

// Centralizar o botão horizontalmente na tela
var pos_x = 540 / 2 - 100; // 100 = metade do botão (200 de largura)

// Criar o botão
var botao = instance_create_layer(pos_x, pos_y, "Instances", obj_botao);

// Definir propriedades
botao.texto_botao = texto;
botao.room_destino = destino;

// Retornar a instância criada (opcional)
return botao;

}