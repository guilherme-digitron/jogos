function gay() {
    color_timer += 1; // Velocidade do arco-íris
    
    // Mantém o hue entre 0 e 360
    var hue = color_timer mod 360;
    
    // image_blend recebe a cor HSV convertida
    image_blend = make_color_hsv(hue, 255, 255);
}
