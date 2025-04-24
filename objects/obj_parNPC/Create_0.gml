#region -----------------------------------initiate variables----------------------------------------------

    mask_index = spr_character_mask;
    
    facing = 270;
    idle = true;
    depth = -y;
    moveX = 0;
    moveY = 0;
    _horizontal = 0;
    _vertical = 0;
    move_speed = WALK_SPEED / 2;
    randomWaitTime = 0;
    randomWalkingTime = 0;
    fixedLocation = false;
    image_speed = 0.0175//--------------------------------------- wrong formulae


    //set collisions

    tilemapEnvironment = layer_tilemap_get_id("Tiles_collisionEnvironment");
    tilemapBuilding = layer_tilemap_get_id("Tiles_collisionBuildings");

    //random movement
    alarm[1] = 1;   

    //character parts
    playerShadowSide = -1;
    
    playerBaseRight = -1;
    playerLegClothesRight = -1;
    playerTorsoClothesRight = -1;
    playerFacialHairRight = -1;
    playerHairRight = -1;
    playerHelmetRight = -1;
    
    playerBaseRightIdle = -1;
    playerLegClothesRightIdle = -1;
    playerTorsoClothesRightIdle = -1;
    playerFacialHairRightIdle = -1;
    playerHairRightIdle = -1;
    playerHelmetRightIdle = -1;
    
    playerShadowFront = -1;
    
    playerBaseUp = -1;
    playerLegClothesUp = -1;
    playerTorsoClothesUp = -1;
    playerFacialHairUp = -1;
    playerHairUp = -1;
    playerHelmetUp = -1;
    
    playerBaseUpIdle = -1;
    playerLegClothesUpIdle = -1;
    playerTorsoClothesUpIdle = -1;
    playerFacialHairUpIdle = -1;
    playerHairUpIdle = -1;
    playerHelmetUpIdle = -1;
    
    playerBaseLeft = -1;
    playerLegClothesLeft = -1;
    playerTorsoClothesLeft = -1;
    playerFacialHairLeft = -1;
    playerHairLeft = -1;
    playerHelmetLeft = -1;
    
    playerBaseLeftIdle = -1;
    playerLegClothesLeftIdle = -1;
    playerTorsoClothesLeftIdle = -1;
    playerFacialHairLeftIdle = -1;
    playerHairLeftIdle = -1;
    playerHelmetLeftIdle = -1;
    
    playerBaseDown = -1;
    playerLegClothesDown = -1;
    playerTorsoClothesDown = -1;
    playerFacialHairDown = -1;
    playerHairDown = -1;
    playerHelmetDown = -1;
    
    playerBaseDownIdle = -1;
    playerLegClothesDownIdle = -1;
    playerTorsoClothesDownIdle = -1;
    playerFacialHairDownIdle = -1;
    playerHairDownIdle = -1;
    playerHelmetDownIdle = -1;

#endregion initiate variables
