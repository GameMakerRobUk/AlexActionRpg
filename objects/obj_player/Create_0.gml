#macro WALK_SPEED 2
#macro RUN_SPEED 4

move_speed = WALK_SPEED;

_playerSleeping = true;

spr_playerWalkRight = spr_male1_baseWalkRight;
spr_playerWalkDown = spr_male1_baseWalkDown;
spr_playerWalkLeft = spr_male1_baseWalkLeft;
spr_playerWalkUp = spr_male1_baseWalkUp;
spr_playerIdleRight = spr_male1_baseIdleRight;
spr_playerIdleDown = spr_male1_baseIdleDown;
spr_playerIdleLeft = spr_male1_baseIdleLeft;
spr_playerIdleUp = spr_male1_baseIdleUp;

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


get_facing_coords = function(){
	/*
		return x/y based on facing
		0 : right
		90 : up
		180 : left
		270 : down
	*/
	
	if (facing == 0){
		return ({x : (x + sprite_width/2), y : y - (sprite_height / 2)});
	}
	if (facing == 180){
		return ({x : (x - sprite_width/2), y : y - (sprite_height / 2)});
	}
	if (facing == 90){
		return ({x : x, y : y - (sprite_height / 2)});
	}
	if (facing == 270){
		return ({x : x, y : y});
	}
	
	show_debug_message("get_facing_coords, not facing up down left or right")
	return ({x : x, y : y});
}
