event_inherited();

i_died = function(){
	instance_destroy();
	instance_create_depth(x, y, depth, obj_fallen_tree);	
}