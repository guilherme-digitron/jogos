spd = 3;               // Velocidade de movimento da cobra (pixels por passo)
hsp = 0;               // Velocidade horizontal (calculada a cada passo)
mov_h = -1;            // Direção inicial no eixo horizontal (-1 = esquerda)
mov_v = 0;             // Direção vertical (0 = sem movimento no eixo Y no início)
vsp = 0;               // Velocidade vertical (calculada a cada passo)
global.active_direction = 1;  // Direção ativa da cobra (1 = esquerda, 2 = direita, 3 = baixo, 4 = cima)
global.ti = 0;         // Variavel para testes, era para ser i mas como nao deu virou ti
global.delay = 2;      // Atraso entre os segmentos (controla o "rastro" do corpo)
global.position = ds_list_create(); // Cria a lista global para armazenar posições anteriores da cabeça
pos = [x, y];          // Variável que armazena a posição atual da cabeça como vetor [x, y]
global.pos_cauda = 90

//testes
time = 0
novo_corpo = 0
ncorpos = 0