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

_frame = irandom(1);

image_index = _frame;
