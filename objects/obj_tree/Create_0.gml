event_inherited();

i_died = function(){
    _currentSprite = spr_treeStump;
	
	//instance_create_depth(x, y, depth, obj_fallen_tree);
    
}

_currentSprite = spr_tree;
_growthStage = 0;
_maxGrowthStage = 2;
_canGrow = false;
_timeSinceLastGrew = 0;
_minGrowthTime = 1000;
_minGrowthTimeMet = false;
_totalGrowthTime = random_range(0, 1000);
_growthTime = 0;


/*
showObjectHealthBar = false; 
showHealthBarTimerLenght = 120;
damageRecentlyTakenTimer = 0;
damageReceived = 0;
maxHp = 50;
hp = 50;
hardness = 5;

yield_tree_branchTiny = 256/4; // ---------------- /4 for testing space per item-------------------------!!!
yield_tree_branchSmall = 64/4;
yield_tree_branchMedium = 16/4;
yield_tree_branchBig = 4/4;
 * /