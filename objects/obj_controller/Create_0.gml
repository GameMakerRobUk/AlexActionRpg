global.debug = 0;

navigatingOptions = false;
maxOption = 3;

#region VIDEO
enum e_videoOptions{ display, brightness};
enum e_display{fullScreen, windowed, last};

currentDisplayOption = e_display.fullScreen; //Selected by default from the display dropdown

a_displayFunction[e_display.fullScreen][0] = scr_display_set_fullscreen;
a_displayFunction[e_display.windowed][0] = scr_display_set_windowed;
a_displayFunction[e_display.fullScreen][1] = "Fullscreen";
a_displayFunction[e_display.windowed][1] = "Windowed";

brightness = 1; //-------------------------------<<< not used ATM, need to complete

#endregion vidoe

#region SOUND
//assigning each stage's song
snd[room_title_screen] = snd_titleScreen; 
snd[room0] = snd_stage1Theme;
currentSound = -1;
selected_option = 0;
last_settings = 0;
last_main_option = 0;
number_of_options = 4;
enum e_soundVolume{masterVolume, music, SFX}
enum e_soundStats{name, volume}
enum e_sfx{select, swap, back}
soundArray[e_soundVolume.masterVolume][e_soundStats.volume] = 1;
soundArray[e_soundVolume.music][e_soundStats.volume] = 1;
soundArray[e_soundVolume.SFX][e_soundStats.volume] = 1;
soundArray[e_soundVolume.masterVolume][e_soundStats.name] = "Master Volume";
soundArray[e_soundVolume.music][e_soundStats.name] = "Music Volume";
soundArray[e_soundVolume.SFX][e_soundStats.name] = "Sound Effects Volume";
a_sfx[e_sfx.select] = snd_select;
a_sfx[e_sfx.swap] = snd_swap;
a_sfx[e_sfx.back] = snd_back;
#endregion sound

//enum e_actors{  leave_empty, player1, player2, player3, player4, Bruiser, Clipper, Chucker, Jackal, Leopard, container, last};
//enum e_stats{Name, Current_HP, Max_HP, Aggresivity, Tactics, Speed, Damage, Current_Stam, Max_Stanm, blockChance, strength, attackRecoverySp, last};
//enum e_factions{player, badguys, predators, containers, last};

//global.all_factions = ds_list_create();

//Make a list for every faction, this will hold the enemy factions
//for (var i = 0; i < e_factions.last; i ++){
//	global.all_factions[| i] = ds_list_create();	
//}

//ds_list_add(global.all_factions[| e_factions.player], e_factions.badguys, e_factions.predators, e_factions.containers);
//ds_list_add(global.all_factions[| e_factions.badguys], e_factions.predators);
//ds_list_add(global.all_factions[| e_factions.predators], e_factions.badguys);

#region INVENTORY
//maxCharacters = 13; //max lenght of the name of an item to display
//showInventory = false;
//selectedInventorySlot = 0;
//displayItems = false;
//itemTypeList = ds_list_create();

////positionning the item sprites on the paperdoll
//for(var i = 0; i < e_inv.last; i++){
//	paperdoll[i][0] = 100; //x
//	paperdoll[i][1] = (i * 64); //y
//}
//paperdoll[e_inv.helmet][0] = 380;
//paperdoll[e_inv.helmet][1] = 100;
//paperdoll[e_inv.armor][0] = 227;
//paperdoll[e_inv.armor][1] = 132;
//paperdoll[e_inv.shield][0] = 400;
//paperdoll[e_inv.shield][1] = 170;
//paperdoll[e_inv.clothing][0] = 300;
//paperdoll[e_inv.clothing][1] = 200;
//paperdoll[e_inv.melee][0] = 190;
//paperdoll[e_inv.melee][1] = 190;
//paperdoll[e_inv.missile][0] = 380;
//paperdoll[e_inv.missile][1] = 240;
//paperdoll[e_inv.legs][0] = 227;
//paperdoll[e_inv.legs][1] = 250;

////assigning a display name to each equipment slot
//menuEquipmentSlots[e_inv.helmet] = "Helmet";
//menuEquipmentSlots[e_inv.armor] = "Armor";
//menuEquipmentSlots[e_inv.clothing] = "Clothing";
//menuEquipmentSlots[e_inv.shield] = "Shield";
//menuEquipmentSlots[e_inv.melee] = "Melee";
//menuEquipmentSlots[e_inv.missile] = "Ranged";
//menuEquipmentSlots[e_inv.legs] = "Legs";

////listing the possible equipment slots
//enum e_inv{helmet, armor, clothing, shield, melee, missile, legs, last, nowhere}

////listing every item im the game
//enum e_item{nothing, improvisedClub, bloodyTunic, footWrappings, roughPlankShield, jackalPelt, pomegranate, fig, leek, bread, cheese, 
//	fowl, last}

////assign each item a sprite
//global.itemSprites[e_item.bloodyTunic] = spr_characterClothes_tunic_bloody;
//global.itemSprites[e_item.improvisedClub] = spr_improvisedClub;
//global.itemSprites[e_item.roughPlankShield] = spr_roughPlankShield;
//global.itemSprites[e_item.pomegranate] = spr_pomegrenate;
//global.itemSprites[e_item.fig] = spr_fig;
//global.itemSprites[e_item.leek] = spr_leek;
//global.itemSprites[e_item.bread] = spr_bread;
//global.itemSprites[e_item.cheese] = spr_cheese;
//global.itemSprites[e_item.fowl] = spr_fowl;

////setting the starting equipment
//global.equipped = ds_grid_create(e_actors.last, e_inv.last)
//global.equipped[# e_actors.player1, e_inv.melee] = e_item.nothing;
//global.equipped[# e_actors.player1, e_inv.missile] = e_item.nothing;
//global.equipped[# e_actors.player1, e_inv.shield] = e_item.roughPlankShield;
//global.equipped[# e_actors.player1, e_inv.helmet] = e_item.nothing;
//global.equipped[# e_actors.player1, e_inv.clothing] = e_item.bloodyTunic;
//global.equipped[# e_actors.player1, e_inv.armor] = e_item.nothing;
//global.equipped[# e_actors.player1, e_inv.legs] = e_item.nothing;

//global.inv = ds_list_create(); //list of inventories
//var list = ds_list_create(); //player 1 inventory
//global.inv[| e_actors.player1] = list; // adding player 1 inventopry to the list of inventories
//ds_list_add(list,e_item.improvisedClub, e_item.bloodyTunic, e_item.bloodyTunic, e_item.pomegranate, e_item.bread, e_item.leek) //adding items to the starting inventory
//global.itemStats = ds_grid_create(e_item_stats.last, e_item.last);
//ds_grid_clear(global.itemStats, e_inv.nowhere);

////assigning each piece of equipment to the right equipment slot
//global.itemStats[# e_item_stats.equipSlot, e_item.improvisedClub] = e_inv.melee;
//global.itemStats[# e_item_stats.equipSlot, e_item.bloodyTunic] = e_inv.clothing;
//global.itemStats[# e_item_stats.equipSlot, e_item.roughPlankShield] = e_inv.shield;

////assigning a display name to each item
//global.itemStats[# e_item_stats.name, e_item.improvisedClub] = "Improvised Club";
//global.itemStats[# e_item_stats.name, e_item.bloodyTunic] = "Bloody Tunic";
//global.itemStats[# e_item_stats.name, e_item.nothing] = "Empty";
//global.itemStats[# e_item_stats.name, e_item.roughPlankShield] = "Rough PLank Shield";
//global.itemStats[# e_item_stats.name, e_item.jackalPelt] = "Intact Jackal Pelt";
//global.itemStats[# e_item_stats.name, e_item.pomegranate] = "Pomegranate";
//global.itemStats[# e_item_stats.name, e_item.fig] = "Fig";
//global.itemStats[# e_item_stats.name, e_item.leek] = "Leek";
//global.itemStats[# e_item_stats.name, e_item.bread] = "Bread";
//global.itemStats[# e_item_stats.name, e_item.cheese] = "Cheese";
//global.itemStats[# e_item_stats.name, e_item.fowl] = "Fowl";


////----------------------------------------------------go over why the following is done this way again, and why it's placed here
////in the code

//enum e_item_stats{name, equipSlot, category, consumableScript, value, affectedStat, duration, last};

//enum e_inventorySection{generalInventory, equippedGear, equipablePerSlot}

////assigning items to the right category
//enum e_itemCategory{equipment, consumable, misc, last} 
////default assignment to every new item since any item which isn't assigned might lead to a crash -------------------- correct?
//for(var i = 0; i < e_item.last; i++){
//	global.itemStats[# e_item_stats.category, i] = e_itemCategory.equipment;
//	global.itemStats[# e_item_stats.consumableScript, i] = -1;
//}
////manually assigning items which don'T fall in the default to the proper category
////global.itemStats[# e_item_stats.category, e_item.pomegranate] = e_itemCategory.consumable;
////global.itemStats[# e_item_stats.category, e_item.fig] = e_itemCategory.consumable;
////global.itemStats[# e_item_stats.category, e_item.leek] = e_itemCategory.consumable;
////global.itemStats[# e_item_stats.category, e_item.bread] = e_itemCategory.consumable;
////global.itemStats[# e_item_stats.category, e_item.cheese] = e_itemCategory.consumable;
////global.itemStats[# e_item_stats.category, e_item.fowl] = e_itemCategory.consumable;

//global.itemStats = load_csv("itemStats.csv")

//global.itemStats[# e_item_stats.consumableScript, e_item.pomegranate] = scr_food;
//global.itemStats[# e_item_stats.consumableScript, e_item.fig] = scr_food;
//global.itemStats[# e_item_stats.consumableScript, e_item.leek] = scr_food;
//global.itemStats[# e_item_stats.consumableScript, e_item.bread] = scr_food;
//global.itemStats[# e_item_stats.consumableScript, e_item.cheese] = scr_food;
//global.itemStats[# e_item_stats.consumableScript, e_item.fowl] = scr_food;

//displayList = ds_list_create();
//guiDisplayList = ds_list_create();
//currentSlot = 0;
#endregion inventory


#region TITLE / main menu
options[0][0] = scr_start;
options[1][0] = scr_pre_load;
options[2][0] = scr_settings;
options[3][0] = scr_exit;
options[e_settings.audio][1] = scr_start;
options[e_settings.video][1] = scr_load;
options[e_settings.keySettings][1] = scr_settings;

enum e_mainMenu_state {save_start, load, settings, quit, title, mainMenu, inventory, playing};
enum e_settings{video, audio, keySettings, last}

settings[e_settings.audio] = "Audio"
settings[e_settings.video] = "Video"
settings[e_settings.keySettings] = "Key Binding"

a_statesText[e_mainMenu_state.save_start] = "save_start"
a_statesText[e_mainMenu_state.load] = "load"
a_statesText[e_mainMenu_state.settings] = "settings"
a_statesText[e_mainMenu_state.quit] = "quit"
a_statesText[e_mainMenu_state.title] = "title"
a_statesText[e_mainMenu_state.mainMenu] = "mainMenu"
a_statesText[e_mainMenu_state.inventory] = "inventory"
a_statesText[e_mainMenu_state.playing] = "playing"

state = e_mainMenu_state.title;
settingsState = e_settings.last;
key_grid_x = 0;
key_grid_y = 0;
choosing_option = false; //If set to true, then we just pressed on an option we want to change
                         //if false we are confirming a choice and can then press up/down/left right
						 //to change options as normal
#endregion title / main menu

#region KEY BINDINGS

//confirmReset = false;

//enum e_keys{l, r, u, d, jump, run, full_screen, windowed, att_low, att_mid, att_high, 
//	        throw_low, throw_mid, throw_high, block_low, block_mid, block_high, pause_menu, use, reset, last}
			
//key_text[e_keys.l] = "LEFT";
//key_text[e_keys.r] = "RIGHT";
//key_text[e_keys.u] = "UP";
//key_text[e_keys.d] = "DOWN";
//key_text[e_keys.jump] = "JUMP";
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
			
////Setup default keys
//scr_setupKeys();

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
#endregion key bindings

displayDropdown = false;
previouslySelectedVideoOption = e_videoOptions.display;

scr_loadSettings();
script_execute(a_displayFunction[currentDisplayOption][0]);
