if (abrir_bau) {
    image_speed = 0.2; 
    sprite_index = spr_chest;

    if (image_index >= image_number - 1 && !iniciou_transicao) {
        iniciou_transicao = true; 
        tempo_espera = room_speed * 15; 
    }
    
    if (iniciou_transicao) {
        tempo_espera -= 1;

        if (tempo_espera > 0) {
            with (obj_pao) {
                visible = true; 
            }
        }

        if (tempo_espera <= 0) {
            with (obj_pao) {
                visible = false; 
            }
            room_goto(rm_start);
        }
    }
} else {
    image_speed = 0; 
    image_index = 0; 
}
