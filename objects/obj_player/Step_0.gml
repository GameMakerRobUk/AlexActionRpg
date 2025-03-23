var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (keyboard_check(vk_shift) && stamina.current > 0){
	move_speed = RUN_SPEED;	
	use_stamina(stamina.run_cost);
}else{
	move_speed = WALK_SPEED;
}

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

if (_hor != 0 or _ver != 0) 
{
    if (_ver > 0) sprite_index = spr_player_walk_down;
    else if (_ver < 0) sprite_index = spr_player_walk_up;
    else if (_hor > 0) sprite_index = spr_player_walk_right;
    else if (_hor < 0) sprite_index = spr_player_walk_left;
        
    facing = point_direction(0, 0, _hor, _ver);
}
else 
{ 
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;    
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
}

if (keyboard_check_pressed(vk_space)) 
{
	if (stamina.current >= stamina.swing_cost){
		use_stamina(stamina.swing_cost);
	    var _inst = instance_create_depth(x, y, depth, obj_attack);
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