#region TITLE / main menu
if (keyboard_check_pressed(vk_escape)){ 
	if(state == e_mainMenu_state.playing){
		state = e_mainMenu_state.mainMenu;
		
	}
	else{
		var vol = soundArray[e_soundVolume.SFX][e_soundStats.volume] * soundArray[e_soundVolume.masterVolume][e_soundStats.volume];
		audio_sound_gain(snd_back, vol, 0);
		audio_play_sound(snd_back, 0, false); //applying any changes which might have been made to sounds while in the menu
		//not playing
		if(settingsState == e_settings.last){ //no settings chosen right now / not on the settings menu in which case it would equal something else
			//player in main menu
			if(state == e_mainMenu_state.title or state == e_mainMenu_state.mainMenu){	
				if(room != room_titleScreen){
					state = e_mainMenu_state.playing;
				} 
				else{
					state = e_mainMenu_state.title;
					maxOption = 3;
				}
			}
			else{
				//back to main menu
				if(room == room_titleScreen){
					state = e_mainMenu_state.title;
				}
				else{
					state = e_mainMenu_state.mainMenu;
				}
				maxOption = 3
			}
		}
		else{
			maxOption = 2;
			selected_option = last_settings; //element of the settings menu selected prior to entering a submenu
			settingsState = e_settings.last; //not in the options menu
		}
	}
}
#endregion title/main menu

#region CHANGING SONGS 
var sound = snd[room] //sound which should be playing
if(sound != currentSound){ //stores -1 or a song for purpose of comparing with what should be playing
	if(currentSound != -1){
		audio_stop_sound(currentSound)
	}
	currentSound = sound;
	soundArray[e_soundVolume.music][e_soundStats.volume] =  clamp(soundArray[e_soundVolume.music][e_soundStats.volume], 0, 1);
	var vol = soundArray[e_soundVolume.music][e_soundStats.volume] * soundArray[e_soundVolume.masterVolume][e_soundStats.volume];
	audio_sound_gain(currentSound, vol, 0);
	audio_play_sound(currentSound, 1, true);
	
}
#endregion changong songs

#region INVENTORY

if(keyboard_check_pressed(ord("I")) and (room != room_titleScreen)){
	if(state != e_mainMenu_state.inventory){
		state = e_mainMenu_state.inventory
		selectedInventorySection = e_inventorySection.generalInventory;
		scr_itemAmount();
	}
	else{
		scr_playing();
	}
}
if(state == e_mainMenu_state.inventory){
	if(keyboard_check_pressed(vk_return)){
		var vol = soundArray[e_soundVolume.SFX][e_soundStats.volume] * soundArray[e_soundVolume.masterVolume][e_soundStats.volume];
		audio_sound_gain(snd_select, vol, 0);
		audio_play_sound(snd_select, 0, false); 
	}
	if(keyboard_check_pressed(global.keys[e_keys.u][1])) or (keyboard_check_pressed(global.keys[e_keys.d][1])) ||
	  (keyboard_check_pressed(global.keys[e_keys.u][0])) or (keyboard_check_pressed(global.keys[e_keys.d][0])){
		var vol = soundArray[e_soundVolume.SFX][e_soundStats.volume] * soundArray[e_soundVolume.masterVolume][e_soundStats.volume];
		audio_sound_gain(snd_swap, vol, 0);
		audio_play_sound(snd_swap, 0, false); 
		//if(displayItems = false){
		
		if(selectedInventorySection == e_inventorySection.equippedGear){
			show_debug_message("scr_changeOption 27")
			selectedInventorySlot = scr_changeOption(selectedInventorySlot, 0, e_inv.last - 1, 1, false)
		}
		else{
			if(selectedInventorySection == e_inventorySection.equipablePerSlot){
				show_debug_message("scr_changeOption 31");
				show_debug_message("ds_list_size(displayList): " + string(ds_list_size(displayList)) );
				selectedInventorySlot = scr_changeOption(selectedInventorySlot, 0, ds_list_size(displayList) -1, 1, false)
				selectedInventorySlot = clamp(selectedInventorySlot, 0, ds_list_size(displayList) - 1);
				if (selectedInventorySlot < 0) selectedInventorySlot = 0;
				show_debug_message("selectedInventorySlot: " + string(selectedInventorySlot) );
				scr_updateGUIdisplayList(selectedInventorySlot);
			}
			else{
				if(selectedInventorySection == e_inventorySection.generalInventory){
					selectedInventorySlot = scr_changeOption(selectedInventorySlot, 0, ds_list_size(itemTypeList) -1, 1, false)
				}
			}
		}
	}
	if(keyboard_check_pressed(vk_backspace)){
		if(selectedInventorySection = e_inventorySection.equipablePerSlot){
			show_debug_message("Dropping an item");
			//DROP AN ITEM
			var list = displayList[| selectedInventorySlot];
			if(list[| 0] != e_item.nothing){
				show_debug_message("Item is NOT nothing");
				if(list[| 1] != -1){
					scr_removeItem(list[| 1]);
				}
				else{
					show_debug_message("equipped slot set to nothing");
					global.equipped[# e_actors.player1, currentSlot] = e_item.nothing;
				}
				var spawnX = irandom_range(10, 50);
				var dis = choose(1-1)
				var xx = obj_player.x + (spawnX * dis);
				var yy = obj_player.y + sprite_height;
				scr_createItem(list[| 0], xx ,yy);
				ds_list_destroy(list);
				ds_list_delete(displayList, selectedInventorySlot);
				show_debug_message("selectedInventorySlot before clamp: " + string(selectedInventorySlot) );
				
				selectedInventorySlot = clamp(selectedInventorySlot, 0, ds_list_size(displayList)-1);
				
				show_debug_message("selectedInventorySlot after clamp: " + string(selectedInventorySlot) );
				if(selectedInventorySlot < 0){
					show_debug_message("setting selectedInventorySlot to 0 (previous: " + string(selectedInventorySlot) + ")" );
					selectedInventorySlot = 0;
				}
				scr_updateDisplayList(currentSlot);
				show_debug_message("selectedInventorySlot: " + string(selectedInventorySlot));
				scr_updateGUIdisplayList(selectedInventorySlot);
			}
		}
	}
	if(keyboard_check_pressed(vk_return)){
		show_debug_message("pressed enter");
		//displayItems = !displayItems;
		if(selectedInventorySection == e_inventorySection.equippedGear){
			currentSlot = selectedInventorySlot;
			scr_updateDisplayList(selectedInventorySlot);
			show_debug_message("pressed enter and running update display list")
			selectedInventorySlot = 0;
			scr_updateGUIdisplayList(0);
			selectedInventorySection = e_inventorySection.equipablePerSlot;
		}
		else{
			if(selectedInventorySection == e_inventorySection.equipablePerSlot){
				//selectedInventorySection = e_inventorySection.equipablePerSlot;			
				list = displayList[| selectedInventorySlot];
				//if(list[| 1] != -1){
				
				//show_debug_message("selectedInventorySlot: " + string(selectedInventorySlot));
				//show_debug_message("list: " + string(list));
				//show_debug_message("list size: " + string(ds_list_size(list)));
				//show_debug_message("list[| 0]: " + string(list[| 0]));
				//show_debug_message("list[| 1]: " + string(list[| 1]));
				if(list[| 1] != -1) or list[| 0] == e_item.nothing{
					show_debug_message("list[| 0]: " + string( global.itemStats[# e_item_stats.name, list[| 0]]));
					//add equipped item back to inventory
					scr_addItem(global.equipped[# e_actors.player1, currentSlot]);
					//equip highlighted item
					global.equipped[# e_actors.player1, currentSlot] = list[| 0];
					//remove item from inventory
					scr_removeItem(list[| 1]);
				}
				selectedInventorySlot = currentSlot;
				selectedInventorySection = e_inventorySection.equippedGear;
				show_debug_message("setting selectedInventorySlot to currentSlot, line 160 [step]: " + string(selectedInventorySlot))
			}
			else{
				if(selectedInventorySection == e_inventorySection.generalInventory){
					var item = itemTypeList[| selectedInventorySlot];	
					var category = global.itemStats[# e_item_stats.category, item];
					show_debug_message("item" + global.itemStats[# e_item_stats.name, item]);
					show_debug_message("category" + string(category));
					if(category == e_itemCategory.consumable){
						show_debug_message("item is consumable " + global.itemStats[# e_item_stats.name, item]);
						var scr = global.itemStats[# e_item_stats.consumableScript, item];
						if(scr != -1){
							script_execute(scr, item, obj_player);
							var playerList = global.inv[| e_actors.player1];
							for(var i = 0; i < ds_list_size(playerList); i++){
								if(playerList[| i] == item){
									var entry = i;
									break;
								}
							}
							scr_removeItem(entry);
						}
					}
				}
			}
		}
	}
	if(keyboard_check_pressed(global.keys[e_keys.l][1])) or (keyboard_check_pressed(global.keys[e_keys.r][1])) or 
	(keyboard_check_pressed(global.keys[e_keys.l][0])) or (keyboard_check_pressed(global.keys[e_keys.r][0])){
		if(selectedInventorySection != e_inventorySection.equipablePerSlot){
			var vol = soundArray[e_soundVolume.SFX][e_soundStats.volume] * soundArray[e_soundVolume.masterVolume][e_soundStats.volume];
			audio_sound_gain(snd_swap, vol, 0);
			audio_play_sound(snd_swap, 0, false); 
			selectedInventorySection = !selectedInventorySection;
			selectedInventorySlot = 0;
		}
	}
}

#endregion INVENTORY

/*if(keyboard_check(vk_enter) and room == room_titleScreen){
room_goto(room0);
}*/

//if(room == room_titleScreen){
if(state == e_mainMenu_state.title or state == e_mainMenu_state.mainMenu or state == e_mainMenu_state.settings){
	#region CHANGE OPTION
	if(keyboard_check_pressed(vk_return)){
		var vol = soundArray[e_soundVolume.SFX][e_soundStats.volume] * soundArray[e_soundVolume.masterVolume][e_soundStats.volume];
		audio_sound_gain(snd_select, vol, 0);
		audio_play_sound(snd_select, 0, false); 
	}
	var up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	var left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	var right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));

	if (state == e_mainMenu_state.title or state == e_mainMenu_state.settings or state == e_mainMenu_state.mainMenu){
		if(up or down){
			show_debug_message("scr_changeOption 127")
			show_debug_message("state = " + string(state))
			selected_option= scr_changeOption(selected_option, 0, maxOption, 1, true);
		}
	}
	#endregion
	
	#region brightness
	if (settingsState == e_settings.video and displayDropdown == false && selected_option == e_videoOptions.brightness){
		//if in the settings menu
		
		var left = keyboard_check(global.keys[e_keys.l][0]) || 
		           keyboard_check(global.keys[e_keys.l][1]);
		var right = keyboard_check(global.keys[e_keys.r][0]) || 
		           keyboard_check(global.keys[e_keys.r][1]);
		
		if (right){
			brightness += 0.01;
		}

		if (left){
			brightness -= 0.01;
		}
		if(left or right){
			brightness =  clamp(brightness, 0, 1);
		}
	}
	#endregion brightness
	
	if (settingsState == e_settings.audio){
		//if in the settings menu
		
		var left = keyboard_check(global.keys[e_keys.l][0]) || 
		           keyboard_check(global.keys[e_keys.l][1]);
		var right = keyboard_check(global.keys[e_keys.r][0]) || 
		           keyboard_check(global.keys[e_keys.r][1]);
		
		if (right){
			soundArray[selected_option][e_soundStats.volume] += 0.01;
		}

		if (left){
			soundArray[selected_option][e_soundStats.volume] -= 0.01;
		}
		soundArray[selected_option][e_soundStats.volume] =  clamp(soundArray[selected_option][e_soundStats.volume], 0, 1);
		var vol = soundArray[e_soundVolume.music][e_soundStats.volume] * soundArray[e_soundVolume.masterVolume][e_soundStats.volume];
		audio_sound_gain(currentSound, vol, 0);
	}
	
	if (settingsState == e_settings.keySettings){
		#region KEY BINDING
		//selecting the key to key to highlight
        if (choosing_option == false && confirmReset == false){
            if (down){
                if (key_grid_y + 1) < e_keys.last key_grid_y ++; else key_grid_y = 0;
            }
            if (up){
                if (key_grid_y > 0) key_grid_y --; else key_grid_y = e_keys.last - 1;
            }
	        if(key_grid_y < e_keys.reset){   
			   //Switch between option 1 and 2 for the keys
	            if (left){
	                if (key_grid_x > 0) key_grid_x --; else key_grid_x = 1;
	            }
	            if (right){
	                if (key_grid_x + 1) < 2 key_grid_x ++; else key_grid_x = 0;
	            }
			}
        }
		if(confirmReset){
			if(left or right){
				confirmationOption = !confirmationOption;
			}
		}
        //changing the key associated to the action
        if (keyboard_check_pressed(vk_anykey)){
            var key = keyboard_key; 
            show_debug_message("key: " + string(key) );
			//selecting the key to change or leaving the settings
            if (choosing_option == false){
                if (key == vk_enter){ 
					if(key_grid_y < e_keys.reset){
						choosing_option = true;	
					}
					else{
						if(key_grid_y = e_keys.reset){
							if(!confirmReset){ 
								confirmReset = true;
								show_debug_message("confirm reset set to true")
								confirmationOption = 0;
							}
							else{
								if(confirmationOption == 1){
									scr_setupKeys();
								}
								confirmReset = false;
							}
						}
					}
				}
                
				//show_message("choosing_option = true");
            }else{
				//changing the key
                if (choosing_option == true){
                    show_debug_message("changed key");
                    global.keys[key_grid_y][key_grid_x] = key;
                    choosing_option = false;
                    //show_message("choosing_option = false");
                }
            }
        }
	#endregion
    }

    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_return) ) and settingsState == e_settings.last{
        //Run an option
        if(state == e_mainMenu_state.title or state == e_mainMenu_state.mainMenu){
			var scr = options[selected_option][0];
			script_execute(scr, false);
		}
		else{
			if(state = e_mainMenu_state.settings){
				settingsState = selected_option;
				if(settingsState == e_settings.audio){
					maxOption = 2;
				}
				else if(settingsState == e_settings.video){
					maxOption = 1;
				}
				
				last_settings = selected_option;
				selected_option = 0;
				//navigatingOptions = true;
			}
		}
		show_debug_message("selected options " + string(selected_option))
		
    }
	else{
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_return)) and settingsState == e_settings.video{
			if(displayDropdown == false and selected_option = e_videoOptions.display){
				displayDropdown = true;
				previouslySelectedVideoOption = selected_option;
				selected_option = currentDisplayOption;
				maxOption = 1;
			}	
			else{
				if(displayDropdown == true){
					var scr = a_displayFunction[selected_option][0];
					script_execute(scr);
					displayDropdown = false;
					currentDisplayOption = selected_option;
					selected_option = previouslySelectedVideoOption;
					maxOption = 1;			
				}
			}
		}
	}
}

