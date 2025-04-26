function treeGrowth(){
    _timeSinceLastGrew += 1;
    
    if (_currentSprite = spr_tree && _timeSinceLastGrew >= _minGrowthTime) {
        _minGrowthTimeMet = true
    }
    
    if (_currentSprite = spr_tree2&& _timeSinceLastGrew >= _minGrowthTime) {
        _minGrowthTimeMet = true
    }
    
    if (_currentSprite = spr_tree3 && _timeSinceLastGrew >= _minGrowthTime) {
        _minGrowthTimeMet = true
    }
    
    if (_currentSprite = spr_tree4 && _timeSinceLastGrew >= _minGrowthTime) {
        _minGrowthTimeMet = true
    }
    
    if (_currentSprite = spr_hazleTree && _timeSinceLastGrew >= _minGrowthTime) {
        _minGrowthTimeMet = true
    }
    
    if (_minGrowthTimeMet == true) {
        _growthTime += 1;
    }
    if (_growthTime >= _totalGrowthTime && obj_player.playerSleeping == true) {
        if (_growthStage < _maxGrowthStage) {
            image_index += 1;
            _growthStage += 1;
            _growthTime = 0;
            _timeSinceLastGrew = 0;
            hp = sqr(sqr(image_index+1));
            stumpHp = sqr(sqr(image_index+1));
            _damageReduction = image_index+2;
        }
    }
}