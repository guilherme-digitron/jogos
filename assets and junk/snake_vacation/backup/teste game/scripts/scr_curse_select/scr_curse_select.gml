function curse_select(){
	
if global.cont >= hard {

	new_curse = irandom(2)
	for (var i = 0; i < array_length(global.curse); i++) {
        if (global.curse[i] == new_curse) {
			
            new_curse += 1
        }
    }
	array_push(global.curse, new_curse)
	hard += 10

}

}