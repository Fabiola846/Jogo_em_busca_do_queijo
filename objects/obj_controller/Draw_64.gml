/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_sprite_ext(spr_bananas,(get_timer()/1000000)*15,22,55,2,2,0,c_white,1);

draw_set_font(fnt_arial);

draw_set_color(c_white);

draw_text(55,10,"x"+string(global.banana));

draw_set_color(c_white);

draw_set_font(-1);
