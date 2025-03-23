function scr_setupKeys(){
	global.keys[e_keys.l][0] = ord("A"); global.keys[e_keys.l][1] = vk_left;
	global.keys[e_keys.r][0] = ord("D"); global.keys[e_keys.r][1] = vk_right;
	global.keys[e_keys.u][0] = ord("W"); global.keys[e_keys.u][1] = vk_up;
	global.keys[e_keys.d][0] = ord("S"); global.keys[e_keys.d][1] = vk_down;
	global.keys[e_keys.jump][0] = vk_space; global.keys[e_keys.jump][1] = -1;
	global.keys[e_keys.run][0] = vk_shift; global.keys[e_keys.run][1] = -1;
	global.keys[e_keys.full_screen][0] = vk_add; global.keys[e_keys.full_screen][1] = -1;
	global.keys[e_keys.windowed][0] = vk_subtract; global.keys[e_keys.windowed][1] = -1;
	global.keys[e_keys.att_low][0] = vk_numpad1; global.keys[e_keys.att_low][1] = -1;
	global.keys[e_keys.att_mid][0] = vk_numpad4; global.keys[e_keys.att_mid][1] = -1;
	global.keys[e_keys.att_high][0] = vk_numpad7; global.keys[e_keys.att_high][1] = -1;
	global.keys[e_keys.throw_low][0] = vk_numpad2; global.keys[e_keys.throw_low][1] = -1;
	global.keys[e_keys.throw_mid][0] = vk_numpad5; global.keys[e_keys.throw_mid][1] = -1;
	global.keys[e_keys.throw_high][0] = vk_numpad8; global.keys[e_keys.throw_high][1] = -1;
	global.keys[e_keys.block_low][0] = vk_numpad3; global.keys[e_keys.block_low][1] = -1;
	global.keys[e_keys.block_mid][0] = vk_numpad6; global.keys[e_keys.block_mid][1] = -1;
	global.keys[e_keys.block_high][0] = vk_numpad9; global.keys[e_keys.block_high][1] = -1;
	global.keys[e_keys.pause_menu][0] = vk_numpad9; global.keys[e_keys.pause_menu][1] = -1;
	global.keys[e_keys.use][0] = ord("E"); global.keys[e_keys.use][1] = -1;
}