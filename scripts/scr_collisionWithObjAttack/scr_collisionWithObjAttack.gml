function scr_collisionWithObjAttack(){
    if (alarm[1] < 0) {
    
        //hitting tree with felling axe
        if (_currentSprite == spr_tree && obj_player.usingTool == true && obj_player.toolEquipped == 1) {
            hp -= max(0, other.damage);
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
         
        //hitting tree2 with felling axe         
        else if (_currentSprite == spr_tree2 && obj_player.usingTool == true && obj_player.toolEquipped == 1) { 
            hp -= max(0, other.damage);  
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting tree3 with felling axe         
        else if (_currentSprite == spr_tree3 && obj_player.usingTool == true && obj_player.toolEquipped == 1) { 
            hp -= max(0, other.damage);  
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting tree4 with felling axe         
        else if (_currentSprite == spr_tree4 && obj_player.usingTool == true && obj_player.toolEquipped == 1) { 
            hp -= max(0, other.damage);  
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting blackbarryBush with felling axe         
        else if (_currentSprite == spr_blackberryBush && obj_player.usingTool == true && obj_player.toolEquipped == 1) { 
            hp -= max(0, other.damage);  
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting hazle with felling axe         
        else if (_currentSprite == spr_hazleTree && obj_player.usingTool == true && obj_player.toolEquipped == 1) { 
            hp -= max(0, other.damage);  
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting village gate with felling axe
        else if (_currentSprite == spr_villageGate && obj_player.usingTool == true && obj_player.toolEquipped == 1) { 
            hp -= max(0, other.damage);  
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        
        }     
        
        //hitting stump with adze    
        else if (_currentSprite == spr_treeStump && obj_player.usingTool == true && obj_player.toolEquipped == 2) {
            stumpHp -= max(0, other.damage);
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }  
    
        //hitting stump2 with adze    
        else if (_currentSprite == spr_treeStump2 && obj_player.usingTool == true && obj_player.toolEquipped == 2) {
            stumpHp -= max(0, other.damage);
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting stump3 with adze    
        else if (_currentSprite == spr_treeStump3 && obj_player.usingTool == true && obj_player.toolEquipped == 2) {
            stumpHp -= max(0, other.damage);
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting stump4 with adze    
        else if (_currentSprite == spr_treeStump4 && obj_player.usingTool == true && obj_player.toolEquipped == 2) {
            stumpHp -= max(0, other.damage);
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting hazleTreeStump with adze    
        else if (_currentSprite == spr_hazleTreeStump && obj_player.usingTool == true && obj_player.toolEquipped == 2) {
            stumpHp -= max(0, other.damage);
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
        
        //hitting bushStump with adze    
        else if (_currentSprite == spr_bushStump && obj_player.usingTool == true && obj_player.toolEquipped == 2) {
            stumpHp -= max(0, other.damage);
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
        }
    
        else if (_currentSprite == spr_stone && obj_player.usingTool == true && obj_player.toolEquipped == 5) {  
            hp -= max(0, other.damage); 
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
            //to add = splits into a random combination of piecespieces which total the size of the stone hit--------------------------------------------------------- 
        }
        
        //hitting anything other than stones or wood pieces with anything but the right tool
        else if (_currentSprite != spr_stone && _currentSprite != spr_woodPiece) {
            
            hp -= max(0, (other.damage - _damageReduction));
            
            if ((other.damage - _damageReduction) > 0) {
            	image_blend = c_red;
            } 
                        
            knockback_x = sign(x - other.x);
            knockback_y = sign(y - other.y);
        } 
        
        alarm[1] = 20; 
    }
}