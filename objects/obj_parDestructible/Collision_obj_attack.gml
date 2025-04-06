if (alarm[1] < 0) 
{
    hp -= other.damage;
    image_blend = c_red;
    
    knockback_x = sign(x - other.x);
    knockback_y = sign(y - other.y);    
    alarm[1] = 20;  
    if (_currentSprite == spr_treeStump) {
        stumpHp -= other.damage;
        image_blend = c_red;
    }  
}