// Inherit the parent event
event_inherited();

i_died = function(){
    instance_destroy(myTilledEarth);
    instance_destroy();
}
_currentSprite = spr_cabbage;
_growthStage = 0;
_maxGrowthStage = 4;
_canGrow = false;
_timeSinceLastGrew = 0;
_minGrowthTime = 100;
_minGrowthTimeMet = false;
_totalGrowthTime = (_minGrowthTime + irandom( 100));
_growthTime = 0;
_damageReduction = 0;
hp = sqr(image_index+1);