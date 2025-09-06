/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

inimigo_morto = false;
levou_dano = false;
inimigo_vida = 3;

velocidade = choose(1,-1);
virar_inimigo = true;

invencivel=false;
tempo_decidir_andar = room_speed;
andando=true;

galinha_hit = instance_create_layer(x,y,layer,obj_hit);

galinha_hit.image_yscale =galinha_hit.image_yscale * 0.7;
galinha_hit.image_xscale =galinha_hit.image_xscale * 1.5;

