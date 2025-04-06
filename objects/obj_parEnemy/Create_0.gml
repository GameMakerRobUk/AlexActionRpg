event_inherited();

target_x = x;
target_y = y;

alarm[0] = 60;

tilemap = layer_tilemap_get_id("Tiles_col");

//knockback
knockback_x = 0;
knockback_y = 0;

i_died = instance_destroy;
_currentSprite = spr_collision;
_damageReduction = 0;
hp = 15;