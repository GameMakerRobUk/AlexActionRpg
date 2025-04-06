//confirmReset = false;

enum e_keys{l, r, u, d, action, run, full_screen, windowed, select, pause_menu, 
            reset, last, quickSlot1, quickSlot2, quickSlot3, quickSlot4, quickSlot5,
            quickSlot6, quickSlot7, quickSlot8, quickSlot9, quickSlot0}
			
//key_text[e_keys.l] = "LEFT";
//key_text[e_keys.r] = "RIGHT";
//key_text[e_keys.u] = "UP";
//key_text[e_keys.d] = "DOWN";
//key_text[e_keys.action] = "ACTION";
//key_text[e_keys.run] = "RUN";
//key_text[e_keys.full_screen] = "FULL SCREEN";
//key_text[e_keys.windowed] = "WINDOWED";
//key_text[e_keys.att_low] = "LOW ATTACK";
//key_text[e_keys.att_mid] = "MIDDLE ATTACK";
//key_text[e_keys.att_high] = "HIGH ATTACK";
//key_text[e_keys.throw_low] = "LOW THROW";
//key_text[e_keys.throw_mid] = "MIDDLE THROW";
//key_text[e_keys.throw_high] = "HIGH THROW";
//key_text[e_keys.block_low] = "LOW BLOCK";
//key_text[e_keys.block_mid] = "MIDDLE BLOCK";
//key_text[e_keys.block_high] = "HIGH BLOCK";
//key_text[e_keys.pause_menu] = "PAUSE MENU";
//key_text[e_keys.use] = "Use";
//key_text[e_keys.reset] = "Reset Keybindings";

//for(var i= ord("A"); i<= ord("Z"); i++){
//	global.ordString[i] = chr(i);
//}

//global.ordString[vk_left] = "Left Arrow";
//global.ordString[vk_up] = "Up Arrow";
//global.ordString[vk_right] = "Right Arrow";
//global.ordString[vk_down] = "Down Arrow";
//global.ordString[vk_space] = "Space";
//global.ordString[vk_shift] = "Shift";
//global.ordString[vk_control] = "Control";
//global.ordString[vk_numpad0] = "Numpad 0";
//global.ordString[vk_numpad1] = "Numpad 1";
//global.ordString[vk_numpad2] = "Numpad 2";
//global.ordString[vk_numpad3] = "Numpad 3";
//global.ordString[vk_numpad4] = "Numpad 4";
//global.ordString[vk_numpad5] = "Numpad 5";
//global.ordString[vk_numpad6] = "Numpad 6";
//global.ordString[vk_numpad7] = "Numpad 7";
//global.ordString[vk_numpad8] = "Numpad 8";
//global.ordString[vk_numpad9] = "Numpad 9";
//global.ordString[vk_multiply] = "Numpad *";
//global.ordString[vk_subtract] = "Numpad -";
//global.ordString[vk_add] = "Numpad +";
			
//Setup default keys
scr_setupKeys();

//if(global.debug){
//	show_debug_message("global.keys[e_keys.l][0]: " + string(global.keys[e_keys.l][0]) );
//	show_debug_message("global.keys[e_keys.l][1]: " + string(global.keys[e_keys.l][1]) );
//	show_debug_message("global.keys[e_keys.r][0]: " + string(global.keys[e_keys.r][0]) );
//	show_debug_message("global.keys[e_keys.r][1]: " + string(global.keys[e_keys.r][1]) );
//	show_debug_message("A: " + string(ord("A")) );
//	show_debug_message("vk_left: " + string(vk_left) );
//	show_debug_message("D: " + string(ord("D")) );
//	show_debug_message("vk_right: " + string(vk_right) );
//}


//start_key = 1; // setting menu first item
//key_margin = 30; //margin between lines in the settings menu
//keysPerScreen = 9; //faximum number of keys to be visible before scrolling 