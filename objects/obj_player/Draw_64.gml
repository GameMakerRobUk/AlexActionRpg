#region draw stamina

var _currentStaminaX = stamina.current / stamina.max;

var _staminaBarX = 0;
var _staminaBarY = display_get_gui_height();

draw_sprite_ext(spr_stamina, 1, _staminaBarX, _staminaBarY, _currentStaminaX, 1, 0, c_white, 1);
draw_sprite(spr_stamina, 0, _staminaBarX, _staminaBarY);

#endregion draw Stamina

#region Draw Quick Equip Menu
    
    #region initiate quick equip menue variables
        var _rotatingMenuCenterX = 0.5 * display_get_gui_width();
        var _rotatingMenuCenterY = 0.5 * display_get_gui_height();
    
        var _numberOfWeaponsOwned = 1;
        var _numberOfToolsOwned = 1;
    
        var _weaponInPositionOne = undefined;
        var _weaponInPositionTwo = undefined;
        var _weaponInPositionThree = undefined;
        var _weaponInPositionFour = undefined;
        var _weaponInPositionFive = undefined;
        var _weaponInPositionSix = undefined;
        var _weaponInPositionSeven = undefined;
        var _weaponInPositionEight = undefined;
        var _weaponInPositionNine = undefined;
        var _weaponInPositionTen = undefined;
    
        var _toolInPositionOne = undefined;
        var _toolInPositionTwo = undefined;
        var _toolInPositionThree = undefined;
        var _toolInPositionFour = undefined;
        var _toolInPositionFive = undefined;
        var _toolInPositionSix = undefined;
        var _toolInPositionSeven = undefined;
        var _toolInPositionEight = undefined;
        var _toolInPositionNine = undefined;
        var _toolInPositionTen = undefined;
    #endregion initiate quick equip menue variables
    
    #region assign weapon sprite to display in each position based on selected weapon
        switch (weaponEquipped) {
        	case 0: 
                var _weaponInPositionOne = spr_fist;
                var _weaponInPositionTwo = spr_walkingStick;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_emptySlot;
            break;
            
            case 1:
                var _weaponInPositionOne = spr_walkingStick;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_fist;
            break;
            
            case 2:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_fist;
                var _weaponInPositionTen = spr_walkingStick;
            break;
            
            case 3:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_fist;
                var _weaponInPositionNine = spr_walkingStick;
                var _weaponInPositionTen = spr_emptySlot;
            break;
            
            case 4:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_fist;
                var _weaponInPositionEight = spr_walkingStick;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_emptySlot;
            break;
            
            case 5:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_fist;
                var _weaponInPositionSeven = spr_walkingStick;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_emptySlot;
            break;
            
            case 6:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_fist;
                var _weaponInPositionSix = spr_walkingStick;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_emptySlot;
            break;
            
            case 7:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_emptySlot;
                var _weaponInPositionFour = spr_fist;
                var _weaponInPositionFive = spr_walkingStick;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_emptySlot;
            break;
            
            case 8:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_emptySlot;
                var _weaponInPositionThree = spr_fist;
                var _weaponInPositionFour = spr_walkingStick;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_emptySlot;
            break;
            
            case 9:
                var _weaponInPositionOne = spr_emptySlot;
                var _weaponInPositionTwo = spr_fist;
                var _weaponInPositionThree = spr_walkingStick;
                var _weaponInPositionFour = spr_emptySlot;
                var _weaponInPositionFive = spr_emptySlot;
                var _weaponInPositionSix = spr_emptySlot;
                var _weaponInPositionSeven = spr_emptySlot;
                var _weaponInPositionEight = spr_emptySlot;
                var _weaponInPositionNine = spr_emptySlot;
                var _weaponInPositionTen = spr_emptySlot;
            break;
        }
    #endregion assign weapon sprite to display in each position based on selected weapon

    #region assign tool sprite to display in each position based on selected tool
        switch (toolEquipped) {
        	case 0:
                _toolInPositionOne = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionTwo = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionTwo = spr_emptySlot;
                }
                if (adzeOwned == true) {
                	_toolInPositionThree = spr_adzeCopper;
                }
                else {
                	_toolInPositionThree = spr_emptySlot;
                } 
                if (hoeOwned == true) {
                	_toolInPositionFour = spr_hoeCopper;
                }
                else {
                	_toolInPositionFour = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionFive = spr_seedBag;
                }
                else {
                	_toolInPositionFive = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionSix = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionSix = spr_emptySlot;
                }
                _toolInPositionSeven = spr_emptySlot;
                _toolInPositionEight = spr_emptySlot;
                _toolInPositionNine = spr_emptySlot;
                _toolInPositionTen = spr_emptySlot;
            break;
            
            case 1:
                if (fellingAxeOwned == true) {
                	_toolInPositionOne = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionOne = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionTwo = spr_adzeCopper;
                }
                else {
                	_toolInPositionTwo = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionThree = spr_hoeCopper;
                }
                else {
                	_toolInPositionThree = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionFour = spr_seedBag;
                }
                else {
                	_toolInPositionFour = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionFive = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionFive = spr_emptySlot;
                }
                _toolInPositionSix = spr_emptySlot;
                _toolInPositionSeven = spr_emptySlot;
                _toolInPositionEight = spr_emptySlot;
                _toolInPositionNine = spr_emptySlot;
                _toolInPositionTen = spr_emptyHand;
            break;
            
            case 2:
                if (adzeOwned == true) {
                	_toolInPositionOne = spr_adzeCopper;
                }
                else {
                	_toolInPositionOne = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionTwo = spr_hoeCopper;
                }
                else {
                	_toolInPositionTwo = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionThree = spr_seedBag;
                }
                else {
                	_toolInPositionThree = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionFour = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionFour = spr_emptySlot;
                }
                _toolInPositionFive = spr_emptySlot;
                _toolInPositionSix = spr_emptySlot;
                _toolInPositionSeven = spr_emptySlot;
                _toolInPositionEight = spr_emptySlot;
                _toolInPositionNine = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionTen = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionTen = spr_emptySlot;
                } 
            break;
            
            case 3:
                if (hoeOwned == true) {
                	_toolInPositionOne = spr_hoeCopper;
                }
                else {
                	_toolInPositionOne = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionTwo = spr_seedBag;
                }
                else {
                	_toolInPositionTwo = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionThree = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionThree = spr_emptySlot;
                }
                _toolInPositionFour = spr_emptySlot;
                _toolInPositionFive = spr_emptySlot;
                _toolInPositionSix = spr_emptySlot;
                _toolInPositionSeven = spr_emptySlot;
                _toolInPositionEight = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionNine = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionNine = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionTen = spr_adzeCopper;
                }
                else {
                	_toolInPositionTen = spr_emptySlot;
                }
            break;
            
            case 4:
                if (seedBagOwned == true) {
                	_toolInPositionOne = spr_seedBag;
                }
                else {
                	_toolInPositionOne = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionTwo = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionTwo = spr_emptySlot;
                }
                _toolInPositionThree = spr_emptySlot;
                _toolInPositionFour = spr_emptySlot;
                _toolInPositionFive = spr_emptySlot;
                _toolInPositionSix = spr_emptySlot;
                _toolInPositionSeven = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionEight = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionEight = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionNine = spr_adzeCopper;
                }
                else {
                	_toolInPositionNine = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionTen = spr_hoeCopper;
                }
                else {
                	_toolInPositionTen = spr_emptySlot;
                }
            break;
            
            case 5:
                if (sledgehammerOwned == true) {
                	_toolInPositionOne = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionOne = spr_emptySlot;
                }
                _toolInPositionTwo = spr_emptySlot;
                _toolInPositionThree = spr_emptySlot;
                _toolInPositionFour = spr_emptySlot;
                _toolInPositionFive = spr_emptySlot;
                _toolInPositionSix = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionSeven = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionSeven = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionEight = spr_adzeCopper;
                }
                else {
                	_toolInPositionEight = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionNine = spr_hoeCopper;
                }
                else {
                	_toolInPositionNine = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionTen = spr_seedBag;
                }
                else {
                	_toolInPositionTen = spr_emptySlot;
                }
            break;
            
            case 6:
                _toolInPositionOne = spr_emptySlot;
                _toolInPositionTwo = spr_emptySlot;
                _toolInPositionThree = spr_emptySlot;
                _toolInPositionFour = spr_emptySlot;
                _toolInPositionFive = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionSix = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionSix = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionSeven = spr_adzeCopper;
                }
                else {
                	_toolInPositionSeven = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionEight = spr_hoeCopper;
                }
                else {
                	_toolInPositionEight = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionNine = spr_seedBag;
                }
                else {
                	_toolInPositionNine = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionTen = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionTen = spr_emptySlot;
                }
            break;
            
            case 7:
                _toolInPositionOne = spr_emptySlot;
                _toolInPositionTwo = spr_emptySlot;
                _toolInPositionThree = spr_emptySlot
                _toolInPositionFour = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionFive = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionFive = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionSix = spr_adzeCopper;
                }
                else {
                	_toolInPositionSix = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionSeven = spr_hoeCopper;
                }
                else {
                	_toolInPositionSeven = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionEight = spr_seedBag;
                }
                else {
                	_toolInPositionEight = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionNine = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionNine = spr_emptySlot;
                }
                _toolInPositionTen = spr_emptySlot;
            break;
            
            case 8:
                _toolInPositionOne = spr_emptySlot;
                _toolInPositionTwo = spr_emptySlot;
                _toolInPositionThree = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionFour = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionFour = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionFive = spr_adzeCopper;
                }
                else {
                	_toolInPositionFive = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionSix = spr_hoeCopper;
                }
                else {
                	_toolInPositionSix = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionSeven = spr_seedBag;
                }
                else {
                	_toolInPositionSeven = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionEight = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionEight = spr_emptySlot;
                }
                _toolInPositionNine = spr_emptySlot;
                _toolInPositionTen = spr_emptySlot;
            break;
            
            case 9:
                _toolInPositionOne = spr_emptySlot;
                _toolInPositionTwo = spr_emptyHand;
                if (fellingAxeOwned == true) {
                	_toolInPositionThree = spr_fellingAxeCopper;
                }
                else {
                	_toolInPositionThree = spr_emptySlot;
                } 
                if (adzeOwned == true) {
                	_toolInPositionFour = spr_adzeCopper;
                }
                else {
                	_toolInPositionFour = spr_emptySlot;
                }
                if (hoeOwned == true) {
                	_toolInPositionFive = spr_hoeCopper;
                }
                else {
                	_toolInPositionFive = spr_emptySlot;
                }
                if (seedBagOwned == true) {
                	_toolInPositionSix = spr_seedBag;
                }
                else {
                	_toolInPositionSix = spr_emptySlot;
                }
                if (sledgehammerOwned == true) {
                	_toolInPositionSeven = spr_sledgehammerCopper;
                }
                else {
                	_toolInPositionSeven = spr_emptySlot;
                }
                _toolInPositionEight = spr_emptySlot;
                _toolInPositionNine = spr_emptySlot;
                _toolInPositionTen = spr_emptySlot;
            break;
        }
    #endregion assign tool sprite to display in each position based on selected tool

    #region draw the appropriate quick equip menu based on if weapons or tools are being used
        if (selectingToolOrWeapon = true) {
            
            //if selecting between weapons
        	if (usingWeapon == true) {
                draw_sprite(_weaponInPositionOne, 1, _rotatingMenuCenterX, _rotatingMenuCenterY - 131);
                draw_sprite(_weaponInPositionTwo, 1, _rotatingMenuCenterX + 100, _rotatingMenuCenterY - 100);
                draw_sprite(_weaponInPositionThree, 1, _rotatingMenuCenterX + 125, _rotatingMenuCenterY - 40);
                draw_sprite(_weaponInPositionFour, 1, _rotatingMenuCenterX + 125, _rotatingMenuCenterY + 10);
                draw_sprite(_weaponInPositionFive, 1, _rotatingMenuCenterX + 100, _rotatingMenuCenterY + 66);
                draw_sprite(_weaponInPositionSix, 1, _rotatingMenuCenterX, _rotatingMenuCenterY + 96);
                draw_sprite(_weaponInPositionSeven, 1, _rotatingMenuCenterX - 100, _rotatingMenuCenterY + 66);
                draw_sprite(_weaponInPositionEight, 1, _rotatingMenuCenterX - 125, _rotatingMenuCenterY + 10);
                draw_sprite(_weaponInPositionNine, 1, _rotatingMenuCenterX - 125, _rotatingMenuCenterY - 40);
                draw_sprite(_weaponInPositionTen, 1, _rotatingMenuCenterX - 100, _rotatingMenuCenterY - 100);
            }
            
            //if selectinv between tools
            else if(usingTool == true) {
            	draw_sprite(_toolInPositionOne, 1, _rotatingMenuCenterX, _rotatingMenuCenterY - 131);
                draw_sprite(_toolInPositionTwo, 1, _rotatingMenuCenterX + 100, _rotatingMenuCenterY - 100);
                draw_sprite(_toolInPositionThree, 1, _rotatingMenuCenterX + 125, _rotatingMenuCenterY - 40);
                draw_sprite(_toolInPositionFour, 1, _rotatingMenuCenterX + 125, _rotatingMenuCenterY + 10);
                draw_sprite(_toolInPositionFive, 1, _rotatingMenuCenterX + 100, _rotatingMenuCenterY + 66);
                draw_sprite(_toolInPositionSix, 1, _rotatingMenuCenterX, _rotatingMenuCenterY + 96);
                draw_sprite(_toolInPositionSeven, 1, _rotatingMenuCenterX - 100, _rotatingMenuCenterY + 66);
                draw_sprite(_toolInPositionEight, 1, _rotatingMenuCenterX - 125, _rotatingMenuCenterY + 10);
                draw_sprite(_toolInPositionNine, 1, _rotatingMenuCenterX - 125, _rotatingMenuCenterY - 40);
                draw_sprite(_toolInPositionTen, 1, _rotatingMenuCenterX - 100, _rotatingMenuCenterY - 100);
            }
            
            //draw selecton indicator overlay
            draw_sprite(spr_quickMenueSelectionIndicator, 1, _rotatingMenuCenterX, _rotatingMenuCenterY - 128);
        }
    #endregion draw the appropriate quick equip menu based on if weapons or tools are being used

#endregion Draw Quick Equip Menu