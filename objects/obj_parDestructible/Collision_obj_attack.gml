if (alarm[1] < 0) 
{
    if (_currentSprite == (spr_tree || spr_tree2) && obj_player.toolEquipped == 2) {
        hp -= other.damage;
        image_blend = c_red;
    }  
    else if (_currentSprite == (spr_tree || spr_tree2)) { 
        hp -= (other.damage - _damageReduction);  
        image_blend = c_red; 
    }    
    else if (_currentSprite == spr_treeStump && obj_player.toolEquipped == 3) {
        stumpHp -= other.damage;
        image_blend = c_red;
    }  
    else if (_currentSprite == spr_treeStump) {
        stumpHp -= (other.damage - _damageReduction);
        image_blend = c_red;
    }//-------------------------------------------------------------------------------------------------------
    else if (_currentSprite == spr_stone && obj_player.toolEquipped == 6) { //splits into a random combination of piecespieces
        hp -= other.damage; 
        image_blend = c_red;   
    }
    else {
        hp -= (other.damage - _damageReduction);
        image_blend = c_red;
        
        knockback_x = sign(x - other.x);
        knockback_y = sign(y - other.y);    
         
    }
    alarm[1] = 20; 
}