event_inherited();

i_died = function(){
    if (_currentSprite == spr_blackberryBush) {
        _currentSprite = spr_bushStump;  
    }
}

hp = 10;
stumpHp = 10;
_damageReduction = 2;

_currentSprite = spr_blackberryBush;

_frame = random_range(0, 2);

if (_frame < 1) {
    image_index = 0;
}
else if (_frame <= 2) {
    image_index = 1;
}