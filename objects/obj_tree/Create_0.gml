event_inherited();

_currentSprite = spr_treeStumpCollision;

i_died = function(){
    if (_currentSprite == spr_tree) {
        _currentSprite = spr_treeStump;   
    }
    else if (_currentSprite == spr_tree2) {
        _currentSprite = spr_treeStump2;  
    }
    else if (_currentSprite == spr_tree3) {
        _currentSprite = spr_treeStump3;  
    }
    else if (_currentSprite == spr_tree4) {
        _currentSprite = spr_treeStump4;  
    }
}

treeType = random_range(0, 4);

if (treeType <= 1) {
    _currentSprite = spr_tree;
}
else if (treeType <= 2) {
    _currentSprite = spr_tree2;
}
else if (treeType <= 3) {
    _currentSprite = spr_tree3;
}   
else if (treeType <= 4) {
    _currentSprite = spr_tree4;
}  



_growthStage = random_range(0, image_number);
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
 