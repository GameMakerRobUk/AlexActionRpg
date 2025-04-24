function scr_start(test){
	show_debug_message("scr_start")
	//if(state == e_mainMenu_state.title){
	//	state = e_mainMenu_state.playing;
	//	if(test = false){
	//		room_goto(room0);
	//	}
	//	else{
	//		room_goto(roomTest);
	//	}
	//}
	//else{
	//	scr_save();
	//}
}

function scr_pre_load(){
	show_debug_message("scr_pre_load")
	//ini_open("saveGame.dat")
	//var rm = ini_read_real("roomName", "currentRoom", room);
	state = e_mainMenu_state.load;
	//show_debug_message("rm " + string(rm))
	//room_goto(rm);
	//ini_close();
}

function scr_load(){
	
	show_debug_message("scr_load is running")
	//ini_open("saveGame.dat")
	//#region save player data
	//	with obj_player{
	//		cooldown_timer = ini_read_real("player cooldown_timer", string(actor_type), cooldown_timer);
	//		state = ini_read_real("player state", string(actor_type), state);
	//		x_frame = ini_read_real("player x_frame", string(actor_type), x_frame);
	//		y_frame = ini_read_real("player y_frame", string(actor_type), y_frame);
	//		block = ini_read_real("player block", string(actor_type), block);
	//		player_hMovement = ini_read_real("player_hMovement", string(actor_type), player_hMovement);
	//		player_vMovement = ini_read_real("player_vMovement", string(actor_type), player_vMovement);
	//		moveX = ini_read_real("player moveX", string(actor_type), moveX);
	//		playersFacing = ini_read_real("playersFacing", string(actor_type), playersFacing);
	//		consumableTimer = ini_read_real("player consumaableTimer", string(actor_type), consumableTimer);
	//		hasEatenFood = ini_read_real("player hasEatenFood", string(actor_type), hasEatenFood);
	//		leftTimer = ini_read_real("player leftTimer", string(actor_type), leftTimer);
	//		rightTimer = ini_read_real("player rightTimer", string(actor_type), rightTimer);
	//		dash = ini_read_real("player dash", string(actor_type), dash);
	//		actor_type = ini_read_real("player actor_type", string(actor_type), actor_type);
	//		state_type = ini_read_real("player state_type", string(actor_type), state_type);
	//		shield_type = ini_read_real("player shield_type", string(actor_type), shield_type);
	//		weapon_type = ini_read_real("player weapon_type", string(actor_type), weapon_type);
	//		midAir = ini_read_real("player midAir", string(actor_type), midAir);
	//		x = ini_read_real("player x", string(actor_type), x);
	//		y = ini_read_real("player y", string(actor_type), y);
	//		for(var i=0; i< e_stats.last; i++){
	//			my_stats[i] = ini_read_string("player stats", string(i), my_stats[i])
	//		}
	//	}
		
	//#endregion save player data
	
	//	var equipmentString = ini_read_string("player items", "player equipped", "");
	//ds_grid_read(global.equipped, equipmentString);
	
	
	//for(i = 0; i < ds_list_size(global.inv); i++){
	//	var inventoryString = ini_read_string("player inventory", string(i), "");
	//	ds_list_read(global.inv[| i], inventoryString);
	//}
	
	//#region LOAD ENEMIES

	//with obj_meta_actorsParent {
	//	with col_mask{instance_destroy()}
	//	show_debug_message("instance destroy scr_load line 51")
	//	instance_destroy()
	//};
		
	//var count = ini_read_real("enemyCount", "numberOfInstances", 0);
	//show_debug_message("count: " + string(count));
	//for(var i = 0; i < count; i++){
	//	var newEnemy = instance_create_layer(0, 0, "enemies", obj_meta_actorsParent);
	//	show_debug_message("x, y, " + string(newEnemy.x)+", " + string(newEnemy.y));
	//	with newEnemy{
	//		sprite_index = ini_read_real("sprite_index", string(i), sprite_index);
	//		combatPositioning = ini_read_real("combatPositioning", string(i), combatPositioning);
	//		combatChangeAttack = ini_read_real("combatChangeAttack", string(i), combatChangeAttack);
	//		windUpDone = ini_read_real("windUpDone", string(i), windUpDone);
	//		hMovement = ini_read_real("hMovement", string(i), hMovement);
	//		vMovement = ini_read_real("vMovement", string(i), vMovement);
	//		moveX = ini_read_real("moveX", string(i), moveX);
	//		facing = ini_read_real("facing", string(i), facing);
	//		x_frame = ini_read_real("x_frame", string(i), x_frame);
	//		y_frame = ini_read_real("y_frame", string(i), y_frame);
	//		midAir = ini_read_real("midAir", string(i), midAir);
	//		frame_size = ini_read_real("frame_size", string(i), frame_size);
	//		state = ini_read_real("state", string(i), state);
	//		timer = ini_read_real("timer", string(i), timer);
	//		redFlash = ini_read_real("redFlash", string(i), redFlash);
	//		aggroRange = ini_read_real("aggroRange", string(i), aggroRange);
	//		aggroTimer = ini_read_real("aggroTimer", string(i), aggroTimer);
	//		targetX = ini_read_real("targetX", string(i), targetX);
	//		weaponRange = ini_read_real("weaponRange", string(i), weaponRange);
	//		player = ini_read_real("player", string(i), player);
	//		damageDealt = ini_read_real("damageDealt", string(i), damageDealt);
	//		showHPtimer = ini_read_real("showHPtimer", string(i), showHPtimer);
	//		enemyAttackSlideMultiplier = ini_read_real("enemyAttackSlideMultiplier", string(i), enemyAttackSlideMultiplier);
	//		actor_type = ini_read_real("actor_type", string(i), e_actors.Jackal);
	//		show_debug_message("actor_type: " + string(actor_type));
	//		x = ini_read_real("enemy x", string(i), x);
	//		y = ini_read_real("enemy y", string(i), y);

	//		show_debug_message("x, y, " + string(x)+", " + string(y));
	//		for(var ii = 0; ii< e_stats.last; ii++){
	//			var key = string(i) + "_" + string(ii);
	//			my_stats[ii] = ini_read_string("enemyStats", key, 0);
	//			show_debug_message("my_stats[" + string(key) + "]: " + string(my_stats[ii]));
	//		}
	//		show_debug_message("my_stats[e_stats.Current_HP: " + string(my_stats[e_stats.Current_HP]));
	//	}
	//	show_debug_message("count: " + string(count));
	//}
	//#endregion load enemies

	//ini_close();
	state = e_mainMenu_state.playing;
}

function scr_exit(){
	show_message("scr_exit");
	game_end();
}

function scr_settings(){
	show_message("scr_settings");
	last_main_option = selected_option;
	selected_option = 0;
	maxOption = e_settings.last - 1;
	state = e_mainMenu_state.settings;
	settingsState = e_settings.last;
}

function scr_saveSettings(){
	ini_open("settings.ini");
	for(var i=0; i<3; i++){
		ini_write_real("volumeSettings", string(i), soundArray[i][e_soundStats.volume]);
	}
	for(var i = 0; i< e_keys.reset; i++){
		for(var ii=0; ii<2; ii++){
			ini_write_real("keyBindings", string(i) + "_" + string(ii), global.keys[i][ii]);	
		}
	}
	ini_write_real("videoSettings", "display", currentDisplayOption);
	ini_write_real("videoSettings", "brightness", brightness);
	var w = window_get_width();
	var h = window_get_height();
	ini_write_real("videoSettings", "windowWidth", w);
	ini_write_real("videoSettings", "windowHeight", h);
	
	ini_close();
}

function scr_loadSettings(){
	ini_open("settings.ini");
	for(var i=0; i<3; i++){
		soundArray[i][e_soundStats.volume] = ini_read_real("volumeSettings", string(i), 1);	
	}
	for(var i = 0; i< e_keys.reset; i++){
		for(var ii=0; ii<2; ii++){
			global.keys[i][ii] = ini_read_real("keyBindings", string(i) + "_" + string(ii), global.keys[i][ii])
		}
	}
	currentDisplayOption = ini_read_real("videoSettings", "display", currentDisplayOption);
	brightness = ini_read_real("videoSettings", "brightness", brightness);
	windowWidth = ini_read_real("videoSettings", "windowWidth", window_get_width());
	windowHeight = ini_read_real("videoSettings", "windowHeight", window_get_height());
	show_debug_message("load script window Height: " + string(windowHeight) + " windowWitdh: " + string(windowWidth))
	
	ini_close();
}

function scr_display_set_fullscreen(){
	window_set_fullscreen(true);
}

function scr_display_set_windowed(){
	window_set_fullscreen(false);
	view_wport[0] = 420;
	view_hport[0] = 270;
}