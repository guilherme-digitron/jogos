// Propriedades do botão
texto_botao = "Botao Generico";
cor_texto = c_white;
cor_fundo = c_gray;
room_destino = ROOM_GAME;

// Tamanho do botão (pode ajustar como quiser)
largura = 200;
altura = 60;

// Atribuir sprite (coloque o nome do seu sprite abaixo)
sprite_index = spr_botao;
if (sprite_index != -1) {
    image_xscale = largura / sprite_get_width(sprite_index);
    image_yscale = altura / sprite_get_height(sprite_index);
}
