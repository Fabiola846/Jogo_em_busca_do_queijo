/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(flag_start && !flag_ativa)
{
   muda_sprite(spr_ckp_flag_out);

   if(image_index >= image_number-1)
   {
      muda_sprite(spr_ckp_flag_idle);
      flag_ativa = true;
   }
}
if(!flag_start && !flag_ativa)
{
   muda_sprite(spr_ckp_haste);
}
