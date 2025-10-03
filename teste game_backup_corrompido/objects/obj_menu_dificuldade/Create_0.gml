/// Variáveis no Create Event do objeto menu

// 1. Define o array de dificuldades com base no idioma
switch (global.language) {
    case 1: // English
        dificuldades = ["EASY", "NORMAL", "BIG N"];
        break;
        
    case 3: // German
        dificuldades = ["EINFACH", "NORMAL", "BIG N"];
        break;
        
    default: // Português (Padrão para case 0)
        // Nota: Os nomes foram padronizados para melhor entendimento.
        dificuldades = ["FÁCIL", "NORMAL", "BIG N"];
        break;
}

// 2. Define a dificuldade inicial (índice 0 do array)
dificuldade_atual = 0; // Começa na primeira opção ("FÁCIL" / "EASY" / "EINFACH")

// 3. O código do sistema de partículas não precisa de tradução e permanece igual
part_sys = part_system_create();
part_tipo = part_type_create();
part_type_shape(part_tipo, pt_shape_pixel);
part_type_size(part_tipo, 1, 1, 0, 0);
part_type_speed(part_tipo, 2, 4, 0, 0);
part_type_direction(part_tipo, 0, 360, 0, 0);
part_type_life(part_tipo, 15, 30);
part_type_color1(part_tipo, c_white);