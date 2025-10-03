global.angulo = 0
global.pontos = 100
global.cont = 0
global.segmento = 95
global.roomw = 576
global.roomh = 960
global.active = -1
global.life = 30
global.imortal = 0
global.paused = false
global.hovered_obj = noone;
global.record = 0
global.curse = []
global.morte = 0
global.nivel = 0
new_curse = -1
if global.dificuldade == 0 {hard = 50}
if global.dificuldade == 1 {hard = 25}
if global.dificuldade == 2 {hard = 10}
if global.dificuldade == 0 {dificuldade = 50}
if global.dificuldade == 1 {dificuldade = 25}
if global.dificuldade == 2 {dificuldade = 10}
if global.dificuldade == 0 {global.life = 15}
if global.dificuldade == 1 {global.life = 10}
if global.dificuldade == 2 {global.life = 3}
active_sfx = global.life
create_poison = 0
create_time = 0
create_growth = 0
create_laser = 0
create_spikes = 0
multi_spikes = 0
create_falcon_v = 0
create_falcon_h = 0
create_poison_2 = 0
create_hall = 0
create_frog = 0
create_block = 0
create_gay = 0
create_heath = 0
dano = 0
if variable_global_exists("historia"){
	if global.historia == 0 {instance_destroy(obj_maca)} 
	else {var maca = instance_create_layer(0, 0, "Instances", obj_maca)}}
var corpo = instance_create_layer(0, 0, "Instances", obj_corpo);
var cabeca = instance_create_layer(global.roomw/2, global.roomh/2 + 100, "Instances", obj_personagem);