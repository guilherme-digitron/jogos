// Define o array com as opções do menu principal
menu_inicial = ["JOGAR", "OPCOES", "SAIR"]

// Garante que o array 'escala' tenha pelo menos o último índice acessado
// Aqui, estamos apenas definindo o último índice do array com valor 0 (pode ser usado como reserva ou inicialização forçada)
escala[array_length(menu_inicial) - 1] = 0

// Inicializa cada elemento do array 'escala' com o valor 1 (tamanho normal)
for (var i = 0; i < array_length(escala); i++) {
	escala[i] = 1
}
