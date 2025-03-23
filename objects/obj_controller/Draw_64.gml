
//if (room == room_titleScreen){
if (state == e_mainMenu_state.mainMenu or state == e_mainMenu_state.title){
	#region TITLE SCREEN
	//global.keys[e_keys.l][0]
	//Draw background
	if(state == e_mainMenu_state.title or room == room_titleScreen){
		draw_sprite(spr_title_screen_no_options, 0, 0, 0);
		draw_sprite(spr_testRoom, 0, sprite_get_width(spr_testRoom), sprite_get_height(spr_testRoom));
		var mouseOver = scr_mouse_over_sprite_gui(spr_testRoom, sprite_get_width(spr_testRoom), sprite_get_height(spr_testRoom));
		if (mouseOver = true && mouse_check_button_pressed(mb_left)){
			scr_start(true)
		}
	}
	var spr_w = sprite_get_width(spr_options);
	var spr_h = sprite_get_height(spr_options);
	var margin = 10; //between options
	
	if(state = e_mainMenu_state.mainMenu){
		var start_y = (display_get_gui_height()/2) -((spr_h + margin)*2);
		var x1 = (display_get_gui_width()/2) - spr_w + 40;
		var y1 = (display_get_gui_height()/2) - ((spr_h + margin)*3);
		var x2 = (display_get_gui_width()/2) + spr_w - 40;
		var y2 = (display_get_gui_height()/2) + ((spr_h + margin)*2);
		
		draw_set_color(c_dkgray);
		draw_set_alpha(0.75);
		draw_rectangle(x1, y1, x2, y2, false);
		draw_set_alpha(1);
	}
	else{
		var start_y = display_get_gui_height() - (number_of_options * (spr_h + margin ));
	}
	var gx = device_mouse_x_to_gui(0);
	var gy = device_mouse_y_to_gui(0);

	//selected_option = -1;

	for (var i = 0; i < number_of_options; i ++){
		var draw_x = display_get_gui_width() / 2;
		var draw_y = start_y + (i * (spr_h + margin) );
		/*
		if (abs (gx - draw_x) < (spr_w/2) ) && (abs (gy - draw_y) < (spr_h / 2) ){
			selected_option = i;
		}
		*/
		var index = i;
		if (state != e_mainMenu_state.settings and selected_option == i) or (state == e_mainMenu_state.settings and i == last_main_option){ 
			index = i + 4; //highlighted version of the option
		}
	
		if(state == e_mainMenu_state.title){
			draw_sprite(spr_options, index, draw_x, draw_y);
		}
		else{
			draw_sprite(spr_optionsInGame, index, draw_x, draw_y);
		}
	}
	#endregion DRAW TITLE SCREEN mainMenu MENU OPTIONS



}
if(state == e_mainMenu_state.settings){
	#region settings
	if(room == room_titleScreen){
		draw_sprite(spr_title_screen_no_options, 0, 0, 0);
	}
	//show_debug_message("settings is running")
		
	#region drawing the background
	x1 = 10;
	y1 = 10;
	x2 = 140;
	y2 = display_get_gui_height()-10
	draw_set_alpha(0.75);
	draw_set_colour(c_black);
	draw_rectangle(x1, y1, x2, y2, false);
	
	xx1 = x2 + 10;
	xx2 = display_get_gui_width()-10
	draw_rectangle(xx1, y1, xx2, y2, false);
	draw_set_alpha(1);
	#endregion;
	
	fontSize = font_get_size(fnt_settingsMenuTitles);
	
	#region setting options
	for(var i = 0; i < e_settings.last; i++){
		draw_set_font(fnt_settingsMenuTitles);
		draw_set_color(c_ltgray);
		if(selected_option == i and settingsState == e_settings.last) or 
		  (settingsState !=e_settings.last and last_settings == i){
			draw_set_color(c_white);
		}
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_text(x1 +10, y1 +10 + (i*(fontSize+fontSize)), settings[i]);	
		
	}
	#endregion
	//draw "settings" sub-menu options	
		if(settingsState == e_settings.video){
			
			#region Display Options
			dropdownX = ((xx2 - xx1) /2) + xx1;
			dropdownY = display_get_gui_height()/3;
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			if(selected_option == e_videoOptions.display){
				draw_set_color(c_white);
			}
			else{
				draw_set_color(c_ltgray);	
			}
			
			if(displayDropdown == false){
							draw_text(dropdownX, dropdownY, a_displayFunction[currentDisplayOption][1]);
			}

			var textWidth = string_length("Windowed Fullscreen") * fontSize;
			var x1 = (dropdownX - 4) - (textWidth / 2);
			var x2 = (dropdownX + 4) + (textWidth / 2);
			var y1 = (dropdownY - 4) - (fontSize / 2);
			var y2 = (dropdownY + 4) + (fontSize / 2);
			draw_rectangle(x1, y1, x2, y2, true);
			draw_rectangle(x2, y1, x2 + (8 + fontSize), y2, true);
			draw_set_color(c_grey);
			draw_triangle((x2 + 4), (y1 + 4), (x2 + 4 + fontSize) , (y1 + 4), (x2 +(fontSize/2) +4), (y2-4), false);
			draw_set_color(c_white);
			draw_triangle((x2 + 4), (y1 + 4), (x2 + 4 + fontSize) , (y1 + 4), (x2 +(fontSize/2) +4), (y2-4), true);
			
			#region dropdown
			if(displayDropdown == true){
				for(var i=0; i < e_display.last; i++){
					if(selected_option == i){
						draw_set_color(c_white);
					}
					else{
						draw_set_color(c_ltgray);	
					}
					draw_text(dropdownX, dropdownY + (i * (fontSize * 1.5)), a_displayFunction[i][1]);	
				}	
			}
			#endregion dropdown
			
			#endregion Display Option
			
			var startCircle_x = xx1 + 50;
			var drawY = dropdownY + (6 * fontSize)
			textY = drawY - fontSize;
			if(selected_option == e_videoOptions.brightness && displayDropdown == false){
				draw_set_color(c_white);
			}
			else{
				draw_set_color(c_ltgray);	
			}
			draw_text(dropdownX, textY, "Brightness");
			//draw_set_font(fnt_settingsMenuTitles)
			//draw_text(xx1 + 50, textY + (i * 4 * fontSize), soundArray[i][e_soundStats.name])
			draw_line(xx1 + 50, drawY, xx2 - 50, drawY);
			var scale = brightness;
			var lineLength = (xx2 - 50) - startCircle_x;
			circleX = startCircle_x + (lineLength * scale);
			draw_circle(circleX, drawY, 10, true);
		}
		if(settingsState == e_settings.audio){
			
			var textY = (display_get_gui_height()/2) - (7 * fontSize)
			var startY = (display_get_gui_height()/2) - (5 * fontSize)
			var startCircle_x = xx1 + 50;
			
			for(var i = 0; i < 3; i++){
				if(i == selected_option){
					draw_set_colour(c_white)
				}
				else{
					draw_set_colour(c_ltgray)
				}
				var drawY = startY + (i * 4 * fontSize)
				draw_set_font(fnt_settingsMenuTitles)
				draw_text(xx1 + 50, textY + (i * 4 * fontSize), soundArray[i][e_soundStats.name])
				draw_line(xx1 + 50, drawY, xx2 - 50, drawY);
				var scale = soundArray[i][e_soundStats.volume];
				var lineLength = (xx2 - 50) - startCircle_x;
				circleX = startCircle_x + (lineLength * scale);
				draw_circle(circleX, drawY, 10, true);
			}
			
			
			//draw_set_font(fnt_settingsMenuTitles)
			//draw_text(xx1 + 50, (display_get_gui_height()/2) - (2 * fontSize), "Music Volume");
			//draw_line(xx1 + 50, (display_get_gui_height()/2) + (0 * fontSize), xx2 - 50,(display_get_gui_height()/2)+ (0 * fontSize));
			//var scale = soundArray[e_soundVolume.music];
			//var startCircle_x = xx1 + 50;
			//var lineLength = (xx2 - 50) - startCircle_x;
			//circleX = startCircle_x + (lineLength * scale);
			//show_debug_message("scale: " + string(scale));
			//show_debug_message("circleX: " + string(circleX));
			//draw_circle(circleX, (display_get_gui_height()/2) + (0 * fontSize), 10, true);

			//draw_set_font(fnt_settingsMenuTitles)
			//draw_text(xx1 + 50, (display_get_gui_height()/2) + (3 * fontSize), "Sound Effects Volume");
			//draw_line(xx1 + 50, (display_get_gui_height()/2) + (5 * fontSize), xx2 - 50,(display_get_gui_height()/2)+ (5 * fontSize));
			//circleX = xx2 - 50;
			//draw_circle(circleX, (display_get_gui_height()/2) + (5 * fontSize), 10, true);
		}	
		if(settingsState == e_settings.keySettings){
			#region drawing key binding sub-sub-menu items
			var count = 0;
			start_key = key_grid_y - keysPerScreen;
			start_key = clamp(start_key, 0, e_keys.last - keysPerScreen);
			for (var yy = start_key; yy < e_keys.last; yy ++){
				var name = key_text[yy];
				var draw_x = 160;
				var draw_y = 20 + (count * key_margin);
				draw_set_halign(fa_left); draw_set_valign(fa_top);
				if(yy == key_grid_y){
					draw_set_colour(c_white);
				}
				else{
					draw_set_color(c_gray);
				}
				if(yy == e_keys.reset){
					draw_rectangle(draw_x, draw_y, (string_width(name) + draw_x), (draw_y + string_height(name)), true)
				}
				draw_text(draw_x, draw_y, name);
			
				if(yy < e_keys.reset){
					for (var i = 0; i < 2; i ++){
						var val = global.keys[yy][i];
			
						if (yy == key_grid_y && i == key_grid_x){
							draw_set_colour(c_white);
							if (choosing_option) draw_set_colour(c_red);
						}
						else draw_set_colour(c_gray);
				
						if(val != -1){
							draw_text(draw_x + 200 + (i * 100), draw_y, global.ordString[val] ); //
						}
					}
				}
				count ++;
			}
			
			if(confirmReset){
				var x1 = (display_get_gui_width()/2) - 100;
				var y1 = (display_get_gui_height()/2) - (fontSize * 2);
				var x2 = (display_get_gui_width()/2) + 100;
				var y2 = (display_get_gui_height()/2);
				draw_set_color(c_black);
				draw_set_alpha(0.75);
				draw_rectangle(x1, y1, x2, y2, false);
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				if(confirmationOption == 0){
					draw_set_color(c_white);
				}
				else{
					draw_set_color(c_grey);
				}
				draw_text(x1 + 50, y1 + fontSize, "NO");
				if(confirmationOption == 1){
					draw_set_color(c_white);
				}
				else{
					draw_set_color(c_grey);
				}
				draw_text(x2 - 50, y1 + fontSize, "YES");
			}
			
			draw_set_colour(c_black);
			draw_rectangle(0, display_get_gui_height()-30, display_get_gui_width(), display_get_gui_height(), false);
			draw_set_colour(c_white);
			draw_rectangle(1, display_get_gui_height()-30, display_get_gui_width()-1, display_get_gui_height()-1, true);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			draw_text(display_get_gui_width() / 2, display_get_gui_height() -2, "Enter to select / confirm, Esc to go back to the previous screen")
		#endregion
		}
	#endregion settings
}

if(state == e_mainMenu_state.inventory){
	#region SHOW INVENTORY

	
	x1 = (display_get_gui_width() * 0.05);
	y1 = (display_get_gui_height() * 0.05);
	x2 = (display_get_gui_width() * 0.95);
	y2 = (display_get_gui_height() * 0.95);
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_rectangle(x1, y1, x2, y2, false);
	draw_set_alpha(1);
	
	draw_set_valign(fa_bottom);
	draw_set_colour(c_white);
	draw_text(display_get_gui_width()/2, display_get_gui_height() - 20, "selectedInventorySection: " + string(selectedInventorySection) );
	draw_text(display_get_gui_width()/2, display_get_gui_height() - 40, "selectedInventorySlot: " + string(selectedInventorySlot) );
	
	#region Draw general inventory
	
	draw_x = display_get_gui_width() - (display_get_gui_width() * 0.90);
	fontSize = font_get_size(fnt_inventoryMenu);
	draw_y = (y1 + 40) //+ i*fontSize*4;
	draw_set_font(fnt_inventoryMenu);
	draw_set_halign(fa_right);
	draw_set_color(c_grey);
	draw_text(draw_x + 100, draw_y, "ITEM");
	draw_set_halign(fa_left);
	draw_text(draw_x + 100, draw_y, "(AMOUNT)");
	
	
	for(var i = 0; i < ds_list_size(itemTypeList); i++){
		var item = itemTypeList[| i];
		var name = global.itemStats[# e_item_stats.name, item];
		var nameTemp = string_copy(name, 1, maxCharacters);
		if(string_length(name) != string_length(nameTemp)){
			nameTemp += "..."
		}
		var parenthesis = "(" + string(itemQuantity[item]) + ")"
		if(selectedInventorySection == e_inventorySection.generalInventory && i = selectedInventorySlot){
			draw_set_color(c_white);
		}
		else{
			draw_set_color(c_grey)
			
		}
		draw_set_halign(fa_right)
		draw_text(draw_x + 100, draw_y +20 + (i * 20), name);
		draw_set_halign(fa_left)
		draw_text(draw_x + 100, draw_y +20 + (i * 20), parenthesis);
	}
	
	#endregion Draw general inventory
	
	#region Draw paperdoll and equipped items on it
	
	draw_sprite_ext(spr_paperDoll, 1, 200, 75, 0.4, 0.4, 0, c_white, 1);
	for(var i=0; i<e_inv.last; i++){
		var item = global.equipped[# e_actors.player1, i];
		draw_x = paperdoll[i][0];
		draw_y = paperdoll[i][1];
		if(item > 0){
			draw_sprite_ext(Sprite_items, item, draw_x, draw_y, 2, 2, 0, c_white, 1)
		}
		draw_set_color(c_white);
	}
	
	#endregion
	
	#region Draw equipped item collumn
	
	for(var i=0; i<e_inv.last; i++){
		draw_x = display_get_gui_width() - (display_get_gui_width() * 0.25);
		fontSize = font_get_size(fnt_inventoryMenu);
		draw_y = (y1 + 40) + i*fontSize*4;
		draw_set_font(fnt_inventoryMenu);
		draw_set_halign(fa_right);
		draw_set_color(c_grey);
		//if(i = selectedInventorySlot and !displayItems) or (i=currentSlot and displayItems){
		if(i = selectedInventorySlot && selectedInventorySection == e_inventorySection.equippedGear){
			draw_set_color(c_white);
		}
		draw_text(draw_x, draw_y, menuEquipmentSlots[i]);  //global.equipped[# 0, selectedInventorySlot]
		//if(displayItems = false){
		if(selectedInventorySection != e_inventorySection.equipablePerSlot){
			draw_set_halign(fa_left)
			var item = global.equipped[# e_actors.player1, i];
			var name = "  " + global.itemStats[# e_item_stats.name, item];
			var nameTemp = string_copy(name, 1, maxCharacters);
			if(string_length(name) != string_length(nameTemp)){
				nameTemp += "..."
			}
			draw_set_color(c_grey);
			draw_text(draw_x, draw_y, nameTemp);
		}
	}	
	
	#endregion Draw equipped item collumn
	
	//if(displayItems){
	if(selectedInventorySection == e_inventorySection.equipablePerSlot){
		start_y = (y1 + 40) + currentSlot*fontSize*4;
		for(var i = 0; i < ds_list_size(guiDisplayList); i++){
			draw_set_halign(fa_left);
			var item = guiDisplayList[| i];
			var name = "  " + global.itemStats[# e_item_stats.name, item];
			
			var nameTemp = string_copy(name, 1, maxCharacters);
			if(string_length(name) != string_length(nameTemp)){
				nameTemp += "..."
			}
			draw_y = start_y + (i * fontSize*1.2);
			//if(guiDisplayList[| i] = displayList[| selectedInventorySlot]){
			if(i = 0){
				draw_set_color(c_white);
			}
			else{
				draw_set_color(c_grey);
			}
			draw_text(draw_x, draw_y, nameTemp);
		}
		draw_set_color(c_white)
		x1 = x2 - 20;
		y1 = start_y - 15;
		x2 = x1;
		y2 = y1 + (ds_list_size(guiDisplayList) * fontSize * 1.2);
		if(ds_list_size(guiDisplayList) > 1){
			draw_line(x1, y1, x2, y2);
			line_height = y2 - y1;;
			scale = selectedInventorySlot / (ds_list_size(displayList) - 1);
			var circle_y = y1 + (line_height * scale);
			var circle_x = x1;
			draw_circle(circle_x, circle_y, 5, true);
		}
	}
	//for(var i=0; i<ds_list_size(global.inv[| obj_player.actor_type]); i++){
	//	var itemType = global.inv[| obj_player.actor_type][| i];
	//	draw_sprite(Sprite_items, itemType, 0, 20+i*20);
	//	draw_text(0, 20 + (i*20), string(global.inv[| obj_player.actor_type][| i]));
	//}
	//draw_set_halign(fa_left);
	//draw_set_valign(fa_top);
	//draw_set_color(c_white);
	//draw_text(0, 0, "guiDisplayList " + string(ds_list_size(guiDisplayList)))
	//draw_text(0,20,"selectedInventorySlot " + string(selectedInventorySlot))

#endregion
}
draw_set_valign(fa_bottom);
draw_text(display_get_gui_width()/2, display_get_gui_height(), a_statesText[state]);
draw_text(display_get_gui_width()/2, display_get_gui_height() -20, string(instance_number(obj_meta_actorsParent)) );
