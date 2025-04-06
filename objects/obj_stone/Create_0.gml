// Inherit the parent event
event_inherited();

image_index = random_range(0,3);
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
