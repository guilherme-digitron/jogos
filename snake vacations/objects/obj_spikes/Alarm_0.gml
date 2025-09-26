if (image_index == 0) {
    image_index = 1; // ativa
} else {
    image_index = 0; // desativa
}

if image_index == 0 {alarm[0] = 60 * 3}
if image_index == 1 {alarm[0] = 60 * 2}