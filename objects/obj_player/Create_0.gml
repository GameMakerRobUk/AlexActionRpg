#region ------------------------------------initiate variables--------------------------------------------

//why should these be macros?------------------------------------------------------

#macro WALK_SPEED 2
#macro RUN_SPEED 4

fullScreen = false;
hp = 10;
hp_total = hp;
damage = 3;
swingTimer = 26;
swignDelay = 25;
equipmentDelay = 0;
swingTimerActivated = false;
playerIdle = true;
playerSleeping = true;
move_speed = WALK_SPEED;
actionKeyTimer = 0;
selectingToolOrWeapon = false;
debug = false;

//character parts

playerShadowSide = spr_characterShadowSide;

playerBaseRight = spr_male1_baseWalkRight;
playerLegClothesRight = spr_male1_blueBreechesRight;
playerFacialHairRight = spr_male1facialHair1Right;
playerHairRight = spr_male1hair1Right;
playerHelmetRight = -1;

playerBaseRightIdle = spr_male1_baseIdleRight;
playerLegClothesRightIdle = spr_male1_blueBreechesRightIdle;
playerFacialHairRightIdle = spr_male1facialHair1RightIdle;
playerHairRightIdle = spr_male1hair1RightIdle;
playerHelmetRightIdle = -1;

playerShadowFront = spr_characterShadowFront;

playerBaseUp = spr_male1_baseWalkUp;
playerLegClothesUp = spr_male1_blueBreechesUp;
playerFacialHairUp = spr_male1facialHair1Up;
playerHairUp = spr_male1hair1Up;
playerHelmetUp = -1;

playerBaseUpIdle = spr_male1_baseIdleUp;
playerLegClothesUpIdle = spr_male1_blueBreechesUpIdle;
playerFacialHairUpIdle = spr_male1facialHair1UpIdle;
playerHairUpIdle = spr_male1hair1UpIdle;
playerHelmetUpIdle = -1;

playerBaseLeft = spr_male1_baseWalkLeft;
playerLegClothesLeft = spr_male1_blueBreechesLeft;
playerFacialHairLeft = spr_male1facialHair1Left;
playerHairLeft = spr_male1hair1Left;
playerHelmetLeft = -1;

playerBaseLeftIdle = spr_male1_baseIdleLeft;
playerLegClothesLeftIdle = spr_male1_blueBreechesLeftIdle;
playerFacialHairLeftIdle = spr_male1facialHair1LeftIdle;
playerHairLeftIdle = spr_male1hair1LeftIdle;
playerHelmetLeftIdle = -1;

playerBaseDown = spr_male1_baseWalkDown;
playerLegClothesDown = spr_male1_blueBreechesDown;
playerFacialHairDown = spr_male1facialHair1Down;
playerHairDown = spr_male1hair1Down;
playerHelmetDown = -1;

playerBaseDownIdle = spr_male1_baseIdleDown;
playerLegClothesDownIdle = spr_male1_blueBreechesDownIdle;
playerFacialHairDownIdle = spr_male1facialHair1DownIdle;
playerHairDownIdle = spr_male1hair1DownIdle;
playerHelmetDownIdle = -1;

//tools and weapons

walkingStickOwned = true;

sledgehammerdamage = 2;

fellingAxeOwned = false;
fellingAxedamage = 2;

adzeOwned = false;
adzedamage = 2;

hoeOwned = false;
seedBagOwned = false;
sledgehammerOwned = false;

cabbageSeedsOwned = true;
amountCabbageSeeds = 3;
cabbageSeedsEquipped = false;
cabbagesOwned = 0;

parsnipSeedsOwned = true;
amountparsnipSeeds = 10;
parsnipSeedsEquipped = true;
parsnipOwned = 0;

wildGarlicOwned = 0;

commonStinkhornOwned = 0;
amethystDececiverOwned = 0;
enokiOwned = 0;
kingBoleteOwned = 0;

smallBranchOwned = 0;
largeBranchOwned = 0;
smallLogOwned = 0;
largeLogOwned = 0;

pebbleOwned = 0;
smallStoneOwned = 0;
mediumStoneOwned = 0;
largeStoneOwned = 0;

handfulOfBlackberriesOwned = 0;
handfulOfHazlenutsOwned = 0;

//farming mechanics

tilledEarthDetected = false;
objectToPickUp  = undefined;
objectType = undefined;

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

tilemapEnvironment = layer_tilemap_get_id("Tiles_collisionEnvironment");
tilemapBuilding = layer_tilemap_get_id("Tiles_collisionBuildings");

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

// setting mask to collision sprite

mask_index = spr_character_mask;

//set facing coords

facing = 0;

forwardTileX = noone;
forwardTileY = noone;

get_facing_coords = function(){
	/*
		return x/y based on facing
		0 : right
		90 : up
		180 : left
		270 : down
	*/
	
    //I don't get how this works--------------------------------------------------------------------------
    
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

usingWeapon = true; 
weaponEquipped = 0;

//0 = nothing equipped
//1 = walking stick

//add and remove tools from list?------------------------------------------------------------------------
usingTool = false;
toolEquipped = 0;
/*
1 = empty hand
2 = felling axe
3 = adze
4 = hoe
5 = seed bag
6 = sledgehammer
7 = 
*/
#endregion initiate variables