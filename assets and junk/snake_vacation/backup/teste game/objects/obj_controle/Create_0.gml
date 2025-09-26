global.angulo = 0
global.pontos = 100
global.cont = 0
global.segmento = 95
global.roomw = 576
global.roomh = 960
global.active = -1
curse = 2
new_curse = -1
hard = 10
global.curse = []
create_poison = 0
create_time = 0
create_growth = 0

var maca = instance_create_layer(global.roomw/2, global.roomh/2, "Instances", obj_maca);
var corpo = instance_create_layer(300, 300, "Instances", obj_corpo);
var cabeca = instance_create_layer(global.roomw/2 - 30, global.roomh/2 - 30, "Instances", obj_personagem);
var cauda = instance_create_layer(600, 600, "Instances", obj_cauda);

