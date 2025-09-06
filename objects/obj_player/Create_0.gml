// Inherit the parent event
event_inherited();

velocidade = 5;
gravidade = 0.3;
forca_pulo = -7;
qtd_pulos = 0;
max_pulos = 2;

sprite_run = spr_mask_run;
sprite_idle = spr_mask_idle;
sprite_wall_jump = spr_mask_wall;
sprite_jump = spr_mask_jump;
sprite_double_jump = spr_mask_fist_jump;
sprite_fall = spr_mask_fall;

move_checkpoint = false;


function input_player() {
    var _left, _right, _jump, _xdirection;

    _left = keyboard_check(ord("A"));
    _right = keyboard_check(ord("D"));
    _jump = keyboard_check_pressed(vk_space);

    _xdirection = _right - _left;
    _velh = (_right - _left) * velocidade;

    var _no_chao = place_meeting(x, y + 1, obj_bloco);
    var _na_parede = place_meeting(x + _xdirection, y, obj_bloco);

    if (_xdirection != 0) {
        image_xscale = _xdirection;
    }

    if (_no_chao) {
        if (_xdirection != 0) {
            sprite_index = sprite_run;
        } else {
            sprite_index = sprite_idle;
        }
    } else if (_na_parede) {
        sprite_index = sprite_wall_jump;
    } else {
        if (qtd_pulos == (max_pulos - 1)) {
            sprite_index = sprite_jump;
        } else {
            sprite_index = sprite_double_jump;
        }
        if (velv > 0) {
			var _inimigo = instance_place(x,y,obj_inimigo_pai);

		if(_inimigo)
		{
		_inimigo.levou_dano = true;
		 velv = forca_pulo;
		}

            sprite_index = sprite_fall;
        }
    }

    if (_no_chao) {
        qtd_pulos = max_pulos;
        if (_jump) {
            velv = forca_pulo;
            qtd_pulos--;
			audio_play_sound(snd_cartoon_jump,2,false);

        }
    } else {
        if (_jump && ( qtd_pulos==1 || qtd_pulos == 2)) {
			qtd_pulos = 1;
            velv = forca_pulo;
            qtd_pulos--;
			audio_play_sound(snd_cartoon_jump,2,false);

        }
    }

    velv += gravidade;

    if (_na_parede && !_no_chao) {
        velv = 1;
        if (_jump) {
            velv = forca_pulo;
            velh = (10 * _xdirection) * -1;
			audio_play_sound(snd_cartoon_jump,2,false);

        }
    }

    velh = lerp(velh, _velh, 0.1);

    if (!place_meeting(x + velh, y, obj_bloco)) {
        x += velh;
    }

    if (!place_meeting(x, y + velv, obj_bloco)) {
        y += velv;
    } else {
        velv = 0;
    }
}
