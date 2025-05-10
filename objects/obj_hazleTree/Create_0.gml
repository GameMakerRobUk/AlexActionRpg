event_inherited();

_currentSprite = spr_hazleTreeWithNuts;

i_died = function(){
    if (_currentSprite == spr_hazleTreeWithNuts || _currentSprite == spr_hazleTree) {
        _currentSprite = spr_hazleTreeStump;   
    }
}

_growthStage = irandom(image_number);
image_index = _growthStage;
_maxGrowthStage = 2;
_canGrow = false;
_timeSinceLastGrew = 0;
_minGrowthTime = 10000;
_minGrowthTimeMet = false;
_totalGrowthTime = _minGrowthTime + random_range(0, 10000);
_growthTime = 0;
_damageReduction = image_index+2;
hp = sqr(sqr(image_index+1));
stumpHp = sqr(sqr(image_index+1));
 