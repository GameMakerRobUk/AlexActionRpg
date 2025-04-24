event_inherited();

i_died = function(){
    instance_destroy();
    
}
_sprite = random_range(0, 3);
if (_sprite < 1) {
    sprite_index = spr_wildFlowers1;
}
else if (_sprite < 2){
    sprite_index = spr_wildFlowers2;
}
else if (_sprite <= 3){
    sprite_index = spr_wildFlowers3;
}

image_index += random_range(0, 3);

