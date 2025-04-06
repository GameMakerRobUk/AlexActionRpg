event_inherited();

i_died = function(){
    _currentSprite = spr_treeStump;
}

treeType = random_range(0, 2);

if (treeType >= 1) {
    _currentSprite = spr_tree;
}
else{
    _currentSprite = spr_tree2;
}



_growthStage = random_range(0, 3);
image_index = _growthStage;
_maxGrowthStage = 2;
_canGrow = false;
_timeSinceLastGrew = 0;
_minGrowthTime = 10000;
_minGrowthTimeMet = false;
_totalGrowthTime = random_range(0, 10000);
_growthTime = 0;
_damageReduction = image_index+2;
hp = sqr(sqr(image_index+1));
stumpHp = sqr(sqr(image_index+1));
 