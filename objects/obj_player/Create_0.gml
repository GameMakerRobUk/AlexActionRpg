#macro WALK_SPEED 1
#macro RUN_SPEED 2

move_speed = WALK_SPEED;

tilemap = layer_tilemap_get_id("Tiles_col");

hp = 10;
hp_total = hp;
damage = 1;

facing = 0;

stamina = {
	current : 75,
	max : 100,
	run_cost : 1,
	swing_cost : 3,
	can_regenerate : true,
	time_before_regen_allowed : 0,
	regen_rate : 0.5,
}

mask_index = spr_player_mask;
