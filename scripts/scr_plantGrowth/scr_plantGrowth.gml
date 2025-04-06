function plantGrowth(){
    _timeSinceLastGrew += 1;
    
    if (_currentSprite = spr_tree && _timeSinceLastGrew >= _minGrowthTime) {
        _minGrowthTimeMet = true
    }
    
    if (_minGrowthTimeMet == true) {
        _growthTime += 1;
    }
    if (_growthTime >= _totalGrowthTime && obj_player._playerSleeping == true) {
        if (_growthStage < _maxGrowthStage) {
            image_index += 1;
            _growthStage += 1;
            _growthTime = 0;
            _timeSinceLastGrew = 0;
        }
    }
}