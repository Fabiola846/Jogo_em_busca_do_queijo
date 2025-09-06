/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (instance_exists(obj_player)) {
	var _target = obj_player;
	
	x = lerp(x, _target.x, 0.75);
	y = lerp(y, _target.y, 0.75);
}

camera_set_view_border(view_camera[0],290,120)
