function scr_setupKeys(){
	global.keys[e_keys.l][0] = ord("A"); global.keys[e_keys.l][1] = vk_left;
	global.keys[e_keys.r][0] = ord("D"); global.keys[e_keys.r][1] = vk_right;
	global.keys[e_keys.u][0] = ord("W"); global.keys[e_keys.u][1] = vk_up;
	global.keys[e_keys.d][0] = ord("S"); global.keys[e_keys.d][1] = vk_down;
	global.keys[e_keys.action][0] = vk_space; global.keys[e_keys.action][1] = ord("E");
	global.keys[e_keys.run][0] = vk_shift; global.keys[e_keys.run][1] = -1;
	global.keys[e_keys.full_screen][0] = vk_add; global.keys[e_keys.full_screen][1] = -1;
	global.keys[e_keys.windowed][0] = vk_subtract; global.keys[e_keys.windowed][1] = -1;
	global.keys[e_keys.select][0] = vk_control; global.keys[e_keys.select][1] = -1;
	global.keys[e_keys.pause_menu][0] = vk_numpad9; global.keys[e_keys.pause_menu][1] = -1;
    global.keys[e_keys.quickSlot1][0] = ord("1"); global.keys[e_keys.quickSlot1][1] = -1;
    global.keys[e_keys.quickSlot2][0] = ord("2"); global.keys[e_keys.quickSlot2][1] = -1;
    global.keys[e_keys.quickSlot3][0] = ord("3"); global.keys[e_keys.quickSlot3][1] = -1;
    global.keys[e_keys.quickSlot4][0] = ord("4"); global.keys[e_keys.quickSlot4][1] = -1;
    global.keys[e_keys.quickSlot5][0] = ord("5"); global.keys[e_keys.quickSlot5][1] = -1;
    global.keys[e_keys.quickSlot6][0] = ord("6"); global.keys[e_keys.quickSlot6][1] = -1;
    global.keys[e_keys.quickSlot7][0] = ord("7"); global.keys[e_keys.quickSlot7][1] = -1;
    global.keys[e_keys.quickSlot8][0] = ord("8"); global.keys[e_keys.quickSlot8][1] = -1;
    global.keys[e_keys.quickSlot9][0] = ord("9"); global.keys[e_keys.quickSlot9][1] = -1;
    global.keys[e_keys.quickSlot0][0] = ord("0"); global.keys[e_keys.quickSlot0][1] = -1;
}