// Inherit the parent event
event_inherited();

_currentSprite = sprite_index;

image_index = irandom(4);
hp = 20;
_damageReduction = 4;

i_died = function(){ 
    if (hp <= 0 && image_index >= 1) {
        image_index -= 1;
        hp = 20;
    }
    else if (hp <= 0) {
        instance_destroy();
    }
    
}
