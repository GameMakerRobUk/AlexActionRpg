function tryTill(_x, _y){
	var _tilled_earth = collision_rectangle(_x - 16, _y - 31, _x + 15, _y, [obj_tilledEarth, tilemapEnvironment, obj_parCollision, obj_parDestructibleNoCollision
], false, false);
	show_debug_message("_tryTill _tilled_earth: " + string(_tilled_earth));
	if (_tilled_earth != noone) {
		show_debug_message("returning false");
        return false;
    }
    else {
        instance_create_depth(_x, _y, depth, obj_tilledEarth);
		show_debug_message("returning true");
        return true;
    }
}