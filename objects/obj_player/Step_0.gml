//toggle fullscreen

if (keyboard_check_pressed(global.keys[e_keys.full_screen][0])) {
    scr_displaySetFullscreen();
}

//movement

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
	use_stamina(stamina.run_cost);
}else{
	move_speed = WALK_SPEED;
}

//if not in select mode, move according to keys pressed
if (selectingToolOrWeapon = false) {
    move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemap, parCollision], undefined, undefined, undefined, move_speed, move_speed);
}

//set correct sprite according to facing coords

if (_horizontal != 0 or _vertical != 0) 
{
    if (_vertical > 0) sprite_index = spr_playerWalkDown;
    else if (_vertical < 0) sprite_index = spr_playerWalkUp;
    else if (_horizontal > 0) sprite_index = spr_playerWalkRight;
    else if (_horizontal < 0) sprite_index = spr_playerWalkLeft;
        
    facing = point_direction(0, 0, _horizontal, _vertical);// show_debug_message("facing: " + string(facing))
}
else 
{ 
    if (sprite_index == spr_playerWalkRight) sprite_index = spr_playerIdleRight;
    else if (sprite_index == spr_playerWalkLeft) sprite_index = spr_playerIdleLeft;
    else if (sprite_index == spr_playerWalkUp) sprite_index = spr_playerIdleUp;    
    else if (sprite_index == spr_playerWalkDown) sprite_index = spr_playerIdleDown;
}

//weapon or tool use delay

if (swingTimerActivated = true) {
    swingTimer += 1;
    if (swingTimer >= swignDelay) {
        swingTimerActivated = false;
    }
}


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
if (keyboard_check_released(global.keys[e_keys.action][0])|| keyboard_check_released( global.keys[e_keys.action][1])) {
   actionKeyTimer = 0; 
}

//to switch between tools, first hold select key

if (keyboard_check(global.keys[e_keys.select][0]) || keyboard_check(global.keys[e_keys.select][1])) {
    
    //enter weapon or tool select mode to stop movement
    selectingToolOrWeapon = true;
    
    //press right to cycle up through weapons
    if (usingWeapon) {
        if (keyboard_check_pressed(global.keys[e_keys.r][0]) || keyboard_check_pressed(global.keys[e_keys.r][0])) {
            
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
        if (keyboard_check_pressed(global.keys[e_keys.l][0]) || keyboard_check_pressed(global.keys[e_keys.l][0])) { 
                
            //if we're at weapon number greater than min go down by one
            if (weaponEquipped > 0) {
                weaponEquipped -= 1;
            }
                
            //otherwise go to weapon number 9
            else {
                weaponEquipped = 9;
            } 
            show_debug_message("weapon " + string(toolEquipped)); // not showing right number------------------------
        }  
    }
    
    //press right to cycle up through tools
        if (usingTool) {
            if (keyboard_check_pressed(global.keys[e_keys.r][0]) || keyboard_check_pressed(global.keys[e_keys.r][0])) {
                
                //if we're at tool number less than max go up by one
                if (toolEquipped <9) {
                    toolEquipped += 1;
                }
                    
                //otherwise go to tool number 0
                else {
                    toolEquipped = 0;
                }
                show_debug_message("tool " + string(toolEquipped));   
            }
                
            //press left to cycle down through tools   
            if (keyboard_check_pressed(global.keys[e_keys.l][0]) || keyboard_check_pressed(global.keys[e_keys.l][0])) { 
                    
                //if we're at tool number greater than min go up by one
                if (toolEquipped >0) {
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

    
//use equiped tool or weapon

if (keyboard_check_pressed( global.keys[e_keys.action][0]) || keyboard_check_pressed( global.keys[e_keys.action][1])) {
	show_debug_message("Action key pressed");
	if (stamina.current >= stamina.swing_cost && swingTimer >= swignDelay){
		use_stamina(stamina.swing_cost);
        swingTimer = 0;
        swingTimerActivated = true;
		
        // Get directional offset based on which way the player is facing
        
        var _forward = undefined;
        switch (facing) {
            case 0:   _forward = [ 15, +15]; break; // right
            case 90:  _forward = [ 0, -16]; break; // up
            case 180: _forward = [-16,  +16]; break; // left
            case 270: _forward = [ 0,  32]; break; // down
        }
        
        // If facing is invalid, exit early
        
        if (_forward == undefined)
            return;
        
        // Determine the position of the tile directly in front of the player
        
        var forwardTileX = x + _forward[0];
        var forwardTileY = y + _forward[1];
        
        //weapon equipped
        
        if (usingWeapon = true) {
            var _coords = get_facing_coords();
            var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
            _inst.image_angle = facing;
            _inst.damage *= damage;  
        }
        
        //using empty hand
        
        /*if (usingTool == true && toolEquipped == 1) {
            if (collision_rectangle(forwardTileX - 16, forwardTileY - 31, forwardTileX + 15, forwardTileY +31, [obj_cabbage], false, false)){
                if (other.image_index >= 3) {
                    //destroy the cabbage
                    cabbagesOwned +=1;
                    show_debug_message("cabbages owned: " + string(cabbagesOwned));
                }
    
            } 
            if (collision_rectangle(forwardTileX - 16, forwardTileY - 31, forwardTileX + 15, forwardTileY +31, [obj_carrot], false, false)){
                if (other.image_index >= 3) {
                    //destroy the cabbage
                    carrotsOwned +=1;
                    show_debug_message("carrots owned: " + string(carrotsOwned));
                }
            }
        }*/
        
        //felling axe equipped
		
		show_debug_message("usingTool: " + string(usingTool));
        show_debug_message("toolEquipped: " + string(toolEquipped));
        if (usingTool == true && toolEquipped == 2){
            var _coords = get_facing_coords();
            var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
            _inst.image_angle = facing;
            _inst.damage *= damage;  
        }
        
        //adze equipped
        
        if (usingTool == true && toolEquipped == 3){
            var _coords = get_facing_coords();
            var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
            _inst.image_angle = facing;
            _inst.damage *= damage;  
        }
        
        //hoe equipped
        
        if (usingTool == true && toolEquipped == 4) {
            //create the tilling function in a variable in case we want to do something based on if the space is tillable or not later on
               
            // If the tile is already tilled or is a plantedPlant...-----------------------------------------------------------------------------------
            
            if (instance_position( forwardTileX, forwardTileY, obj_tilledEarth) /*|| instance_position( forwardTileX, forwardTileY, obj_parPlantedPlant)*/ ) {
				show_debug_message("there is an instance of tilled_earth");
			    tilledEarthFaced = instance_position( forwardTileX, forwardTileY, obj_tilledEarth); 
                tilledEarthFacedX = tilledEarthFaced.x;
                tilledEarthFacedY = tilledEarthFaced.y;
                // Determine which side of the center of the target tile the player is on
                                            
                var sideFromCenterX = sign(x - tilledEarthFacedX);
                var sideFromCenterY = sign(y - tilledEarthFacedY);
                            
                // Calculate the side-adjacent tile position (perpendicular to facing direction)
                            
                var adjacentTileX = tilledEarthFacedX + ((_forward[0] != 0) ? sideFromCenterX * 32 : 0);
                var adjacentTileY = tilledEarthFacedY + ((_forward[1] != 0) ? sideFromCenterY * 32 : 0);
                         
                // Try to till the side-adjacent tile
                            
                tryTill(adjacentTileX, adjacentTileY);
            }
            
            // If the tile in front is not tilled, try to till it
            
            else {
				show_debug_message("there is NO instance of tilled_earth");
                tryTill(forwardTileX, forwardTileY);
            }
        }
 
        //action switched to tools and seedbag equipped
		
        if (usingTool == true && toolEquipped == 5) {
            if (collision_rectangle(forwardTileX - 16, forwardTileY - 31, forwardTileX + 15, forwardTileY +31, [obj_tilledEarth], false, false)) {
                if (instance_position( forwardTileX, forwardTileY, obj_tilledEarth)) {
                    tilledEarthFaced = instance_position( forwardTileX, forwardTileY, obj_tilledEarth); 
                    tilledEarthFacedX = tilledEarthFaced.x;
                    tilledEarthFacedY = tilledEarthFaced.y;
                     
                    if (cabbageSeedsEquipped == true) { 
                        if (amountCabbageSeeds > 0) {
                            amountCabbageSeeds -= 1;
                            instance_destroy(tilledEarthFaced);
                            instance_create_depth(tilledEarthFacedX, tilledEarthFacedY, depth, obj_cabbage);
                        }
                        else {
                            show_debug_message("out of cabbage seeds");
                        }
                   
                    }
                    if (carrotSeedsEquipped == true) {
                        if (amountCarrotSeeds > 0) {
                            amountCarrotSeeds -= 1;
                            instance_destroy(tilledEarthFaced);
                            instance_create_depth(tilledEarthFacedX, tilledEarthFacedY, depth, obj_carrot);
                        }
                        else {
                            show_debug_message("out of cabbage seeds");
                        }
                                
                    }
                
                }  
            }
        }
        
        //using sledgehammer
        
        if (usingTool == true && toolEquipped == 6){
                var _coords = get_facing_coords();
                var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
                _inst.image_angle = facing;
                _inst.damage *= damage;  
        }
    }
}


//stamina regeneration

stamina.time_before_regen_allowed = clamp(stamina.time_before_regen_allowed - 1, 0, stamina.time_before_regen_allowed);
if (stamina.time_before_regen_allowed == 0){
	stamina.can_regenerate = true;	
}

if (stamina.can_regenerate){
	add_stamina(stamina.regen_rate);
}

//set player depth

depth = -y;