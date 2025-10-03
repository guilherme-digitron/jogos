// =============================================================================
// Evento Create do Objeto de Controle (VERSÃO CORRIGIDA)
// =============================================================================

// --- VARIÁVEIS GLOBAIS DO JOGO ---

global.points = 0;

var nave = instance_create_layer(random_range(100, 900), random_range(100, 900), "Instances", obj_nave);
var meteoro = instance_create_layer(random_range(0, -100), random_range(100, 900), "Instances", obj_meteoro);
var meteoro2 = instance_create_layer(random_range(0, -100), random_range(100, 900), "Instances", obj_meteoro);
var meteoro3 = instance_create_layer(random_range(0, -100), random_range(100, 900), "Instances", obj_meteoro);
var meteoro4 = instance_create_layer(random_range(0, -100), random_range(100, 900), "Instances", obj_meteoro);
var meteoro5 = instance_create_layer(random_range(0, -100), random_range(100, 900), "Instances", obj_meteoro);