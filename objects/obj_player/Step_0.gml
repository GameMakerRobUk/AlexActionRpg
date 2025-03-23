left = keyboard_check( global.keys[e_keys.l][0] ) || keyboard_check( global.keys[e_keys.l][1] );
right = keyboard_check( global.keys[e_keys.r][0] )|| keyboard_check( global.keys[e_keys.r][1] );
up = keyboard_check( global.keys[e_keys.u][0] ) || keyboard_check( global.keys[e_keys.u][1] );
down = keyboard_check( global.keys[e_keys.d][0] )|| keyboard_check( global.keys[e_keys.d][1] );
//left_pressed = keyboard_check_pressed( global.keys[e_keys.l][0] ) || keyboard_check_pressed( global.keys[e_keys.l][1] );
//right_pressed = keyboard_check_pressed( global.keys[e_keys.r][0] )|| keyboard_check_pressed( global.keys[e_keys.r][1] );

var _hor = right - left;
var _ver = down - up;

if (keyboard_check( global.keys[e_keys.run][0]) && stamina.current > 0){
	move_speed = RUN_SPEED;	
	use_stamina(stamina.run_cost);
}else{
	move_speed = WALK_SPEED;
}

move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, parCollision], undefined, undefined, undefined, move_speed, move_speed);

if (_hor != 0 or _ver != 0) 
{
    if (_ver > 0) sprite_index = spr_player_walk_down;
    else if (_ver < 0) sprite_index = spr_player_walk_up;
    else if (_hor > 0) sprite_index = spr_player_walk_right;
    else if (_hor < 0) sprite_index = spr_player_walk_left;
        
    facing = point_direction(0, 0, _hor, _ver);// show_debug_message("facing: " + string(facing))
}
else 
{ 
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;    
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
}

if (keyboard_check_pressed( global.keys[e_keys.jump][0] )) 
{
	if (stamina.current >= stamina.swing_cost){
		use_stamina(stamina.swing_cost);
		//var _inst = instance_create_depth(x, y, depth, obj_attack);
		var _coords = get_facing_coords();
		var _inst = instance_create_depth(_coords.x, _coords.y, depth, obj_attack);
	    _inst.image_angle = facing;
	    _inst.damage *= damage;   
	}
}

stamina.time_before_regen_allowed = clamp(stamina.time_before_regen_allowed - 1, 0, stamina.time_before_regen_allowed);
if (stamina.time_before_regen_allowed == 0){
	stamina.can_regenerate = true;	
}

if (stamina.can_regenerate){
	add_stamina(stamina.regen_rate);
}

depth = -y;