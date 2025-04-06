//why should these be macros?------------------------------------------------------

#macro WALK_SPEED 2
#macro RUN_SPEED 4

//initiate variables

fullScreen = false;
hp = 10;
hp_total = hp;
damage = 5;
swingTimer = 26;
swignDelay = 25;
swingTimerActivated = false;
playerSleeping = true;
move_speed = WALK_SPEED;
actionKeyTimer = 0;
selectingToolOrWeapon = false;


//set player sprites to be used based on action being done

spr_playerWalkRight = spr_male1_baseWalkRight;
spr_playerWalkDown = spr_male1_baseWalkDown;
spr_playerWalkLeft = spr_male1_baseWalkLeft;
spr_playerWalkUp = spr_male1_baseWalkUp;
spr_playerIdleRight = spr_male1_baseIdleRight;
spr_playerIdleDown = spr_male1_baseIdleDown;
spr_playerIdleLeft = spr_male1_baseIdleLeft;
spr_playerIdleUp = spr_male1_baseIdleUp;

//set collisions

tilemap = layer_tilemap_get_id("Tiles_collision");

//stamina use

stamina = {
	current : 1000,
	max : 1000,
	run_cost : 1,
	swing_cost : 3,
	can_regenerate : true,
	time_before_regen_allowed : 0,
	regen_rate : 0.5,
}

// what does this do?-------------------------------------------------------------------------

mask_index = spr_player_mask;

//set facing coords

facing = 0;

get_facing_coords = function(){
	/*
		return x/y based on facing
		0 : right
		90 : up
		180 : left
		270 : down
	*/
	
    //I don't get this--------------------------------------------------------------------------
    
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

//what is currently being used and what is equipped

//what buttons to use?----------------------------------------------------------------------------------
usingWeapon = true; 
weaponEquipped = 1;

//0 = nothing equipped
//1 = walking stick

//add and remove tools from list?------------------------------------------------------------------------
usingTool = false;
toolEquipped = 1;
/*
1 = empty hand
2 = felling axe
3 = adze
4 = hoe
5 = seed bag
6 = sledgehammer
7 = 
*/

tilledEarthDetected = false;

amountCabbageSeeds = 3;
cabbageSeedsEquipped = true;
cabbagesOwned = 0;

amountCarrotSeeds = 3;
carrotSeedsEquipped = false;
carrotsOwned = 0;