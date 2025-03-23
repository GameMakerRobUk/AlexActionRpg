#region Draw Stamina

var _xscale = stamina.current / stamina.max;

var _x = 0;
var _y = display_get_gui_height();

draw_sprite_ext(spr_stamina, 1, _x, _y, _xscale, 1, 0, c_white, 1);
draw_sprite(spr_stamina, 0, _x, _y);

#endregion