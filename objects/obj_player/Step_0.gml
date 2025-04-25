#region -------------------------------------toggle fullscreen--------------------------------------------

if (keyboard_check_pressed(global.keys[e_keys.full_screen][0])) {
    scr_displaySetFullscreen();
}

//pause the game when using menues
if (selectingToolOrWeapon = true) {
    
    //show_debug_message("selecting weapon or tool"); 
    
    //disable instance layer-----------------------------------------------------------------------------
    instance_deactivate_layer("Instances");
}
else {
    instance_activate_layer("Instances");
}

#endregion toggle fullscreen

#region ------------------------------------------movement------------------------------------------------

left = keyboard_check( global.keys[e_keys.l][0]) || keyboard_check( global.keys[e_keys.l][1]);
right = keyboard_check( global.keys[e_keys.r][0]) || keyboard_check( global.keys[e_keys.r][1]);
up = keyboard_check( global.keys[e_keys.u][0]) || keyboard_check( global.keys[e_keys.u][1]);
down = keyboard_check( global.keys[e_keys.d][0]) || keyboard_check( global.keys[e_keys.d][1]);
//not used left_pressed = keyboard_check_pressed( global.keys[e_keys.l][0] ) || keyboard_check_pressed( global.keys[e_keys.l][1] );
//not used right_pressed = keyboard_check_pressed( global.keys[e_keys.r][0] )|| keyboard_check_pressed( global.keys[e_keys.r][1] );

var _horizontal = right - left;
var _vertical = down - up;

if (keyboard_check( global.keys[e_keys.run][0]) && stamina.current > 0){
	move_speed = RUN_SPEED;	
    if ((_horizontal != 0) || (_vertical != 0)) {
	    use_stamina(stamina.run_cost);
    }
}
else{
	move_speed = WALK_SPEED;
}

//if not in select mode, move according to keys pressed
if (selectingToolOrWeapon = false) {
    playerIdle = true;
    move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemapEnvironment, tilemapBuilding, obj_parCollision], undefined, undefined, undefined, move_speed, move_speed);
}

//set correct sprite according to facing coords

if (selectingToolOrWeapon = false && _horizontal != 0 or selectingToolOrWeapon = false && _vertical != 0) 
{
    playerIdle = false;
    if (_vertical > 0){  sprite_index = spr_playerWalkDown; facing = 270;}
    else if (_vertical < 0){ sprite_index = spr_playerWalkUp; facing = 90;}
    else if (_horizontal > 0){ sprite_index = spr_playerWalkRight;facing = 0;}
    else if (_horizontal < 0){ sprite_index = spr_playerWalkLeft;facing = 180;}
        
    //facing = point_direction(0, 0, _horizontal, _vertical);// show_debug_message("facing: " + string(facing))
}
else 
{ 
    if (sprite_index == spr_playerWalkRight) sprite_index = spr_playerIdleRight;
    else if (sprite_index == spr_playerWalkLeft) sprite_index = spr_playerIdleLeft;
    else if (sprite_index == spr_playerWalkUp) sprite_index = spr_playerIdleUp;    
    else if (sprite_index == spr_playerWalkDown) sprite_index = spr_playerIdleDown;
}
#endregion movement

#region ---------------------------------weapon or tool use delay-----------------------------------------

if (swingTimerActivated = true) {
    swingTimer += 1;
    if (swingTimer >= (swignDelay + equipmentDelay)) {
        swingTimerActivated = false;
    }
}
#endregion weapon or tool use delay

#region --------------------------------weapon and tool use toggle-----------------------------------------

//toggle between weapon and tool/free hand use

if (keyboard_check( global.keys[e_keys.action][0]) || keyboard_check( global.keys[e_keys.action][1])) {
    actionKeyTimer += 1;
    if (actionKeyTimer >= 50) {
        actionKeyTimer = 0;
        usingWeapon = !usingWeapon;
        usingTool = !usingTool;
        audio_play_sound(snd_select, 1, false);
    }
}

//reset timer for switching between weapons and tools on action key release

if (keyboard_check_released(global.keys[e_keys.action][0])|| keyboard_check_released( global.keys[e_keys.action][1])) {
   actionKeyTimer = 0; 
}

#endregion weapon and tool use toggle

#region --------------------------switch between tools or between weapons----------------------------------

//to switch between tools, first hold select key

if (keyboard_check(global.keys[e_keys.select][0]) || keyboard_check(global.keys[e_keys.select][1])) {
    
    
    //enter weapon or tool select mode to stop movement
    selectingToolOrWeapon = true;
    
    //press right to cycle up through weapons
    
    if (usingWeapon) {
        if (keyboard_check_pressed(global.keys[e_keys.r][0]) || keyboard_check_pressed(global.keys[e_keys.r][1])) {
            
            //play sfx
            
            audio_play_sound(snd_select, 1, false);
            
            //if we're at weapon number less than max go up by one
            
            if (weaponEquipped <9) {
                weaponEquipped += 1;
            }
                
            //otherwise go to weapon number 0
            
            else {
                weaponEquipped = 0;
            }
            show_debug_message("weapon " + string(weaponEquipped));   
        }
            
        //press left to cycle down through weapons 
          
        if (keyboard_check_pressed(global.keys[e_keys.l][0]) || keyboard_check_pressed(global.keys[e_keys.l][1])) { 
                
            //play sfx
            
            audio_play_sound(snd_select, 1, false);
            
            //if we're at weapon number greater than min go down by one
            
            if (weaponEquipped > 0) {
                weaponEquipped -= 1;
            }
                
            //otherwise go to weapon number 9
            
            else {
                weaponEquipped = 9;
            } 
            show_debug_message("weapon " + string(weaponEquipped)); // not showing right number------------------------
        }  
    }
    
        //press right to cycle up through tools
    
        if (usingTool) {
            if (keyboard_check_pressed(global.keys[e_keys.r][0]) || keyboard_check_pressed(global.keys[e_keys.r][1])) {
                
                //play sfx
                
                audio_play_sound(snd_select, 1, false);
                
                //if we're at tool number less than max go up by one
                
                if (toolEquipped < 9) {
                    toolEquipped += 1;
                }
                    
                //otherwise go to tool number 0
                
                else {
                    toolEquipped = 0;
                }
                show_debug_message("tool " + string(toolEquipped));   
            }
                
            //press left to cycle down through tools  
             
            if (keyboard_check_pressed(global.keys[e_keys.l][0]) || keyboard_check_pressed(global.keys[e_keys.l][1])) { 
                
                //play sfx
                
                audio_play_sound(snd_select, 1, false);
                    
                //if we're at tool number greater than min go up by one
                
                if (toolEquipped > 0) {
                    toolEquipped -= 1;
                }
                    
                //otherwise go to tool number 9
                
                else {
                    toolEquipped = 9;
                } 
                show_debug_message("tool " + string(toolEquipped)); 
            }  
        }
}
else {
    
    //exit weapon or tool select mode to resume movement
    
    selectingToolOrWeapon = false;
}

#endregion weapon and tool toggle and selection

#region --------------------use equiped tool or weapon when action key pressed-----------------------------

if (keyboard_check_pressed( global.keys[e_keys.action][0]) || keyboard_check_pressed( global.keys[e_keys.action][1])) {
	show_debug_message("Action key pressed");

    //if we have enough stamina and we can swing again
	if (stamina.current >= stamina.swing_cost && swingTimer >= (swignDelay + equipmentDelay)){
		show_debug_message("we have enough stamina to swing and can swing again");
        
        #region ---------------set variables regarding stamina, direction,etc.-----------------------------
        
        use_stamina(stamina.swing_cost);
        swingTimer = 0;
        equipmentDelay = 0;
        swingTimerActivated = true;
		
        // Get directional offset based on which way the player is facing
        
        var _forward = undefined;
        var forwardTileXspawn = x;
        var forwardTileYspawn = y + 16;
        switch (facing) {
            case 0: // right
                _forward = [32, 16]; 
               forwardTileXspawn = x + 16;
            break; 
            case 90: // up  
                _forward = [16, -32];
                forwardTileYspawn = y;
            break;            
            case 180: //left
                _forward = [-32, +16];
                forwardTileXspawn = x - 16;
            break;
            case 270: // down
                _forward = [ 16,  32];
                forwardTileYspawn = y + 32;
            break; 
            default:
                break;
        }
        var forwardTileX = x + _forward[0];
        var forwardTileY = y + _forward[1];
        

        
        // If facing is invalid, exit early
        
        if (_forward == undefined)
            return;
        
        // Determine the position of the tile directly in front of the player-------------comment in the wrong place
        
        #endregion set variables regarding stamina, direction,etc.

        #region ------------------------------using weapons-----------------------------------------------
        
        if ( usingWeapon = true) {
            var _coords = get_facing_coords();
            var _inst = instance_create_depth(_coords.x, _coords.y, depth + 10, obj_attack);
            _inst.image_angle = facing;
            _inst.damage *= damage; 
            equipmentDelay = 0;

        }
        
        #endregion using weapons
        
        #region -------------------------------using tools------------------------------------------------
        
            show_debug_message("usingTool: " + string(usingTool));
            show_debug_message("toolEquipped: " + string(toolEquipped));       
            if (usingTool == true /*&& toolEquipped == 1*/) {
            
            #region -----------------------empty hand equipped-------------------------------------------------------------- 
                    
                //look for a harvestable plant or item and get its ID if there is one
				objectToPickUp = noone;
                objectToPickUp = collision_rectangle(x - 16, y - 16, x + 15, y + 15,  [obj_parPlantedPlant, obj_parItems, obj_parFruitTree], false, false);
                show_debug_message("object to pick up or harvest = " + string(objectToPickUp));
                   
                //if there was something there
                if objectToPickUp != noone and (object_get_parent(objectToPickUp.object_index == obj_parPlantedPlant) 
                    || object_get_parent(objectToPickUp.object_index) == obj_parItems 
                    || object_get_parent(objectToPickUp.object_index) == obj_parFruitTree) {
                        
                    //what kind of plant or object is it?
                    objectType = objectToPickUp.object_index;
                    show_debug_message("kind of object = " + string(objectType));
                        
                    #region -----------object is a harvestable plant------------------------------------------------
                    
                    objectsParent = object_get_parent(objectType);
                    if (objectsParent == obj_parPlantedPlant) { 
                        
                        show_debug_message("obj to pick up is an harvestable plant")
                        	
                        //if it isn't fully grown or only has a single growth stage
                        if (objectToPickUp.image_index != 4){
                            show_debug_message("plant can't be harvested yet or only has a single growth stage");
                            
                                //if object only has a single growth stage
                                switch (objectType) {
                                	case obj_mushroom: 
                                        show_debug_message("object is a mushroom")
                                        switch (objectToPickUp.image_index) {
                                            case 0:
                                                kingBoleteOwned += 1;
                                                show_debug_message("kingBolete harvested. kingBoleteOwned = " +string(kingBoleteOwned)); 
                                            break;
                                            case 1:
                                                enokiOwned += 1;
                                                show_debug_message("enoki harvested. enookiOwned = " +string(enokiOwned)); 
                                            break;
                                            case 2:
                                                amethystDececiverOwned += 1;
                                                show_debug_message("amethystDeceiver harvested. amethyseDeceiverOwned = " +string(amethystDececiverOwned)); 
                                            break;
                                            case 3:
                                                commonStinkhornOwned += 1;
                                                show_debug_message("commonStinkhorn harvested. commonStinkhormOwned = " +string(commonStinkhornOwned)); 
                                            break;
                                        }
                                    objectToPickUp.hp = 0;
                                    break;
                                }
                        
                            
                        } 
                        //if so, destroy the instance    
                        else {
                            show_debug_message("plant ready to harvest");
                            objectToPickUp.hp = 0; //------------------------------------------------------not working
                                
                            //and add one of the right type of plant to inventory
                            switch (objectType) {
                                case obj_cabbage: 
                                    cabbagesOwned += 1;
                                    show_debug_message("cabbage harvested. Cabbages owned = " + string(cabbageSeedsOwned));    
                                break;
                                case obj_parsnip: 
                                    parsnipOwned += 1;
                                    show_debug_message("parsnip harvested. parsnip owned = " +string(parsnipOwned));    
                                break; 
                                case obj_wildGarlic: 
                                    wildGarlicOwned += 1;
                                    show_debug_message("wildGarlic harvested. wildGarlicOwned = " +string(wildGarlicOwned));    
                                break; 
                            }
                        }
                    }
                    
                    #endregion object is a harvestable plant
                    
                    #region -----------------object is an item-------------------------------------------------------
                    
                    else if (objectsParent == obj_parItems){
                        show_debug_message("object is an item");
                        switch (objectType) {
                            case obj_fellingAxeCopped : 
                                fellingAxeOwned = true;
                                show_debug_message("felling axe acquired");    
                            break;
                            case obj_adzeCopper : 
                                adzeOwned = true;
                                show_debug_message("adze acquired");   
                            break;
                            case obj_hoeCopper : 
                                hoeOwned = true;
                                show_debug_message("hoe acquired");   
                            break;
                            case obj_seedBag : 
                                seedBagOwned = true;
                                show_debug_message("seed bag acquired");   
                            break;
                            case obj_sledgehammerCopper : 
                                sledgehammerOwned = true;
                                show_debug_message("sledgehammer acquired = " + string(sledgehammerOwned));   
                            break;
                            case obj_woodPiece : 
                                switch (objectToPickUp.image_index){
                                	case 0 :
                                        smallBranchOwned += 1;
                                        show_debug_message("smallBranch acquired = " + string(smallBranchOwned)); 
                                    break;
                                    case 1 :
                                        largeBranchOwned += 1;
                                        show_debug_message("largeBranch acquired = " + string(largeBranchOwned)); 
                                    break;
                                    case 2 :
                                        smallLogOwned += 1;
                                        show_debug_message("smallLog acquired = " + string(smallLogOwned)); 
                                    break;
                                    case 3 :
                                        largeLogOwned += 1;
                                        show_debug_message("largeLog acquired = " + string(largeLogOwned)); 
                                    break;
                                }
                                  
                            break; 
                            case obj_stone : 
                                switch (objectToPickUp.image_index) { //---------------------------------not working
                                	case 0 :
                                        pebbleOwned += 1;
                                        show_debug_message("pebble acquired. Owned = " + string(pebbleOwned)); 
                                    break;
                                    case 1 :
                                        smallStoneOwned += 1;
                                        show_debug_message("smallStone acquired. Owned = " + string(smallStoneOwned)); 
                                    break;
                                    case 2 :
                                        mediumStoneOwned += 1;
                                        show_debug_message("mediumStone acquired. Owned = " + string(mediumStoneOwned)); 
                                    break;
                                    case 3 :
                                        largeStoneOwned += 1;
                                        show_debug_message("largeStone acquired. Owned = " + string(largeStoneOwned)); 
                                    break;
                                }
                                  
                            break; 
                                 
                        }
                        instance_destroy(objectToPickUp);
                    }
                    
                    #endregion object is an item
                    
                    #region -------------object is a fruit tree------------------------------------------------------
                    
                        else if (objectsParent == obj_parFruitTree) {
                        	switch (objectType) {
                            	case obj_blackberryBush :
                                    if (objectToPickUp.image_index == 1) {
                                        handfulOfBlackberriesOwned += 1;
                                        show_debug_message("handfulOfBlackberries acquired. Owned = " + string(handfulOfBlackberriesOwned));
                                        objectToPickUp._frame = 0;
                                    }
                                break;
                                case obj_hazleTree :
                                    if (objectToPickUp._currentSprite == spr_hazleTreeWithNuts) {
                                        if (objectToPickUp.image_index == 1) {
                                        	handfulOfHazlenutsOwned += 1;
                                            show_debug_message("handfulOfHazlenuts acquired. Owned = " + string(handfulOfHazlenutsOwned));
                                            objectToPickUp._currentSprite = spr_hazleTree;
                                        }
                                        else if (objectToPickUp.image_index == 2) {
                                        	handfulOfHazlenutsOwned += 3;
                                            show_debug_message("handfulOfHazlenuts acquired. Owned = " + string(handfulOfHazlenutsOwned));
                                            objectToPickUp._currentSprite = spr_hazleTree;
                                        }
                                        
                                    }
                                break;
                            }
                        }
                    
                    #endregion object is a fruit tree
                    
                    //if there is nothing there
                    else {
                        show_debug_message("nothing to pick up there");
                    } 
                }
        
            #endregion empty hand equipped
        
            #region -----------------------felling axe equipped--------------------------------------------
		        show_debug_message("fellingAxeOwned = " + string(fellingAxeOwned));
                if (usingTool == true && fellingAxeOwned == true && toolEquipped == 1){
                    
                    var _coords = get_facing_coords();
                    var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
                    _inst.image_angle = facing;
                    _inst.damage *= damage + fellingAxedamage;  
                    equipmentDelay = 25;
                }
        
            #endregion felling axe equipped
        
            #region --------------------------adze equipped------------------------------------------------
        
                if (usingTool == true && adzeOwned == true && toolEquipped == 2){
                    var _coords = get_facing_coords();
                    var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
                    _inst.image_angle = facing;
                    _inst.damage *= damage + adzedamage;  
                    equipmentDelay = 25;
                }
        
            #endregion adze equipped
        
            #region ---------------------------hoe equipped-------------------------------------------------
        
                //what does this do exactly? how is it different from the other coords being set elsewhere?---------------------
                var _xx = x;
                var _yy = y - 16;
                if facing == 270 or facing == 90{
                    _xx = x -16;
                    _yy = y;
                }
                
                var _instTilledEarth = collision_rectangle(_xx, _yy, forwardTileX, forwardTileY, obj_tilledEarth, false, true);
                

				
                if (usingTool == true && hoeOwned == true && toolEquipped == 3) {
                    //create the tilling function in a variable in case we want to do something based on if the space is tillable or not later on
                       
                    // If the tile is already tilled or is a plantedPlant...-----------------------------------------------------------------------------------

                    if _instTilledEarth != noone{
        				show_debug_message("there is an instance of tilled_earth");
        			    tilledEarthFaced = _instTilledEarth;//instance_position( forwardTileX, forwardTileY, obj_tilledEarth); 
                        tilledEarthFacedX = tilledEarthFaced.x;
                        tilledEarthFacedY = tilledEarthFaced.y;
                        // Determine which side of the center of the target tile the player is on
                                                    
                        var sideFromCenterX = sign(x - tilledEarthFacedX);
                        var sideFromCenterY = sign(y - tilledEarthFacedY);
                                    
                        // Calculate the side-adjacent tile position (perpendicular to facing direction)
                                    /*
                        var adjacentTileX = tilledEarthFacedX + ((_forward[0] != 0) ? sideFromCenterX * 32 : 0);
                        var adjacentTileY = tilledEarthFacedY + ((_forward[1] != 0) ? sideFromCenterY * 32 : 0);*/
                        var _decal = 33;
                        if sideFromCenterX == -1
                            _decal = -33;
                            
                        var adjacentTileX = tilledEarthFacedX + _decal;
                        var adjacentTileY = tilledEarthFacedY;
                                 
                        // Try to till the side-adjacent tile
                                    
                        tryTill(adjacentTileX, adjacentTileY);
                        equipmentDelay = 0;
                    }
                    
                    // If the tile in front is not tilled, try to till it
                    else {
        				show_debug_message("there is NO instance of tilled_earth");
                        tryTill(forwardTileXspawn, forwardTileYspawn);
                        equipmentDelay = 0;
                    }
                }
         
        #endregion hoe equipped
        
            #region -------------------------seedbag equipped-----------------------------------------------
		
                if (usingTool == true && seedBagOwned == true && toolEquipped == 4) {
                    
                    //if there is a tilledEarth to plant in
                    
                    if (_instTilledEarth != noone) {
                       
                       //and there isn't anything planted in it already  
                        
                       if (_instTilledEarth.image_index = 0){
                            tilledEarthFaced = _instTilledEarth;
                            tilledEarthFacedX = tilledEarthFaced.x;
                            tilledEarthFacedY = tilledEarthFaced.y;
                            equipmentDelay = 0; 
                            
                            //if you're using cabbage seeds    
                                    
                            if (cabbageSeedsOwned == true && cabbageSeedsEquipped == true) { 
                                if (amountCabbageSeeds > 0) {
                                    amountCabbageSeeds -= 1;
                                    tilledEarthFaced.image_index = 1;
                                    instance_create_depth(tilledEarthFacedX, tilledEarthFacedY - 12, depth, obj_cabbage, {myTilledEarth : _instTilledEarth});
        
                                }
                                else {
                                    show_debug_message("out of cabbage seeds");
                                }
                           
                            }
                            
                            //if you're using parsnipSeeds
                        
                            if (parsnipSeedsOwned == true && parsnipSeedsEquipped == true) {
                                if (amountparsnipSeeds > 0) {
                                    amountparsnipSeeds -= 1; 
                                    tilledEarthFaced.image_index = 1;
                                    instance_create_depth(tilledEarthFacedX, tilledEarthFacedY, depth, obj_parsnip, {myTilledEarth : _instTilledEarth});
                                }
                                else {
                                    show_debug_message("out of cabbage seeds");
                                }
                                        
                            }
                        }  
                    }  
                }
        
        #endregion seedbag equipped
        
            #region -----------------------sledgehammer equipped--------------------------------------------
        
                if (usingTool == true && sledgehammerOwned == true && toolEquipped == 5){
                    var _coords = get_facing_coords();
                    var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
                    _inst.image_angle = facing;
                    _inst.damage *= damage + sledgehammerdamage;
                    equipmentDelay = 75;  
                }
        
            #endregion sledgehammer equipped
        
        }
        
        #endregion using tools
        
    } //end if we have enough stamina and we can swing again
}

#endregion use equiped tool or weapon - if action key pressed

#endregion use equiped tool or weapon when action key pressed

#region ------------------------------------stamina regeneration---------------------------------------------

stamina.time_before_regen_allowed = clamp(stamina.time_before_regen_allowed - 1, 0, stamina.time_before_regen_allowed);
if (stamina.time_before_regen_allowed == 0){
	stamina.can_regenerate = true;	
}

if (stamina.can_regenerate){
	add_stamina(stamina.regen_rate);
}

#endregion stamina regeneration

//set player depth

depth = -y;

if (keyboard_check_pressed(ord("/"))) {
	debug = -debug;
} 
