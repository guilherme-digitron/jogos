randomize();
angulo()
array_sort(global.curse, true)
curse_select()

if new_curse == 0 and create_time == 0 {

	var time_curse = instance_create_layer(global.roomw/2 - 96, global.roomh/2 - 382, "Instances", obj_timer);
	create_time = 1

}

if new_curse == 1 and create_poison == 0 {

	var maca_curse = instance_create_layer(global.roomw/2, global.roomh/2, "Instances", obj_maca_poison);
	create_poison = 1

}

if new_curse == 2 and create_growth == 0 {

	create_growth = 1

}