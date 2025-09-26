function hover_mouse(){
	
	if (position_meeting(mouse_x, mouse_y, id)) {
    global.hovered_obj = id; // guarda a referência do objeto "sob o mouse"
} else if (global.hovered_obj == id) {
    global.hovered_obj = noone; // se o mouse saiu, limpa
}


}