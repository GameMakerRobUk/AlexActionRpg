event_inherited();

hasFruits = irandom(1);

if (hasFruits ==1 ) {
	_currentSprite = spr_hazleTreeWithNuts;
}
else {
	_currentSprite = spr_hazleTree;
}

i_died = function(){
    if (_currentSprite == spr_hazleTreeWithNuts || _currentSprite == spr_hazleTree) {
        _currentSprite = spr_hazleTreeStump;   
    }
}


fruitSeason = "fall";
fruitGrowthTime = 500;
fruitTimer = 0;
spriteWithNuts = spr_hazleTreeWithNuts;
spriteWithoutNuts = spr_hazleTree;

_growthStage = irandom(image_number);
image_index = _growthStage;
_maxGrowthStage = 2;
_canGrow = false;
_timeSinceLastGrew = 0;
_minGrowthTime = 10000;
_minGrowthTimeMet = false;
_totalGrowthTime = _minGrowthTime + irandom( 10000);
_growthTime = 0;
_damageReduction = image_index+2;
hp = sqr(sqr(image_index+1));
stumpHp = sqr(sqr(image_index+1));