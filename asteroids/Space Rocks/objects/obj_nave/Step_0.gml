//-_-//

//move keyboard
direction = image_angle

if keyboard_check(vk_left) or keyboard_check(ord("D")){

	image_angle += 4;

}

if keyboard_check(vk_right) or keyboard_check(ord("A")){

	image_angle-= 4;

}

//move mobile

if device_mouse_check_button(0, mb_left) {

	var _touch_x = device_mouse_x(0);
	var _touch_y = device_mouse_y(0);
	var _angle_target = point_direction(x,y, _touch_x, _touch_y);
	var _angle_diferenca = angle_difference(image_angle, _angle_target);
	image_angle -= sign(_angle_diferenca) * min(abs(_angle_diferenca), 4)

}

//sair da tela
move_wrap(true,true,0)

//morte

if place_meeting(x, y, obj_meteoro){

	effect_create_above(ef_firework, x, y, 1, c_white);
	//instance_destroy();
	//obj_controle.alarm[0] = 120;

}