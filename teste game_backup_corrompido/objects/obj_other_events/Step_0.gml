if obj_historia.historia == 1 {

	global.historia = 1
	room_goto(ROOM_GAME)


}

if obj_historia.boss == 1 {

	if obj_dev.y < 128 {
	
		obj_dev.y += 3
	
	}

}