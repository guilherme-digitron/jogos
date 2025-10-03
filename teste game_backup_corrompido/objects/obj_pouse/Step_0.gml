if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        if global.paused == false {
		
			global.paused = true
			instance_create_layer(0,0, "Instances", obj_pause)
		
		} 
    }
}
