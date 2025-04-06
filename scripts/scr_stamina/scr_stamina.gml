function add_stamina(_stamina_value){
	stamina.current = clamp(stamina.current + _stamina_value, 0, stamina.max);
}

function use_stamina(_stamina_cost){
	stamina.current = clamp(stamina.current - _stamina_cost, 0, stamina.max);
	stamina.can_regenerate = false;
	stamina.time_before_regen_allowed = room_speed;
}