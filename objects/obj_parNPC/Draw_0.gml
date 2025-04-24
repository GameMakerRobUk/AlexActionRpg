#region ----------------------------------draw character parts------------------------------------------------

switch (facing) {
	
    #region ----------------------------------facing right----------------------------------------------
        case 0  :
            if (playerShadowSide != -1) draw_sprite_part(playerShadowSide, 0, 0, 0, 32, 32, x-16, y-16);
            if (idle = false) {
            	if (playerBaseRight != -1) draw_sprite_part(playerBaseRight, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesRight != -1) draw_sprite_part(playerLegClothesRight, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesRight != -1) draw_sprite_part(playerTorsoClothesRight, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairRight != -1) draw_sprite_part(playerFacialHairRight, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairRight != -1) draw_sprite_part(playerHairRight, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHelmetRight != -1) draw_sprite_part(playerHelmetRight, image_index, 0, 0, 64, 64, x-32, y-100);    
            }
            else {
            	if (playerBaseRightIdle != -1) draw_sprite_part(playerBaseRightIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesRightIdle != -1) draw_sprite_part(playerLegClothesRightIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesRightIdle != -1) draw_sprite_part(playerTorsoClothesRightIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairRightIdle != -1) draw_sprite_part(playerFacialHairRightIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairRightIdle != -1) draw_sprite_part(playerHairRightIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHelmetRightIdle != -1) draw_sprite_part(playerHelmetRightIdle, image_index, 0, 0, 64, 64, x-32, y-100);  
            }
            
            
        break;
    #endregion facing right
    
    #region -----------------------------------facing up-------------------------------------------------
        case 90  :
            if (playerShadowFront != -1) draw_sprite_part(playerShadowFront , 0, 0, 0, 32, 32, x-16, y-16);
            if (idle = false) {
            	if (playerBaseUp != -1) draw_sprite_part(playerBaseUp, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesUp != -1) draw_sprite_part(playerLegClothesUp, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesUp != -1) draw_sprite_part(playerTorsoClothesUp, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairUp != -1) draw_sprite_part(playerFacialHairUp, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairUp != -1) draw_sprite_part(playerHairUp, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHelmetUp != -1) draw_sprite_part(playerHelmetUp, image_index, 0, 0, 64, 64, x-32, y-100);    
            }
            else {
            	if (playerBaseUpIdle != -1) draw_sprite_part(playerBaseUpIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesUpIdle != -1) draw_sprite_part(playerLegClothesUpIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesUpIdle != -1) draw_sprite_part(playerTorsoClothesUpIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairUpIdle != -1) draw_sprite_part(playerFacialHairUpIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairUpIdle != -1) draw_sprite_part(playerHairUpIdle, image_index, 0, 0, 64, 64, x-32, y-64); 
                if (playerHelmetUpIdle != -1) draw_sprite_part(playerHelmetUpIdle, image_index, 0, 0, 64, 64, x-32, y-100);
            }
            
            
        break;
    #endregion facing up
    
    #region ----------------------------------facing left------------------------------------------------
        case 180  :
            if (playerShadowSide != -1) draw_sprite_part(playerShadowSide, 0, 0, 0, 32, 32, x-16, y-16);
            if (idle = false) {
            	if (playerBaseLeft != -1) draw_sprite_part(playerBaseLeft, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesLeft != -1) draw_sprite_part(playerLegClothesLeft, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesLeft != -1) draw_sprite_part(playerTorsoClothesLeft, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairLeft != -1) draw_sprite_part(playerFacialHairLeft, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairLeft != -1) draw_sprite_part(playerHairLeft, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHelmetLeft != -1) draw_sprite_part(playerHelmetLeft, image_index, 0, 0, 64, 64, x-32, y-100);
            }
            else {
            	if (playerBaseLeftIdle != -1) draw_sprite_part(playerBaseLeftIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesLeftIdle != -1) draw_sprite_part(playerLegClothesLeftIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesLeftIdle != -1) draw_sprite_part(playerTorsoClothesLeftIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairLeftIdle != -1) draw_sprite_part(playerFacialHairLeftIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairLeftIdle != -1) draw_sprite_part(playerHairLeftIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHelmetLeftIdle != -1) draw_sprite_part(playerHelmetLeftIdle, image_index, 0, 0, 64, 64, x-32, y-100);
            }
        break;
    #endregion facing left
    
    #region ----------------------------------facing down----------------------------------------------
        case 270  :
            if (playerShadowFront != -1) draw_sprite_part(playerShadowFront, 0, 0, 0, 32, 32, x-16, y-16);
            if (idle = false) {
            	if (playerBaseDown != -1) draw_sprite_part(playerBaseDown, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesDown != -1) draw_sprite_part(playerLegClothesDown, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesDown != -1) draw_sprite_part(playerTorsoClothesDown, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairDown != -1) draw_sprite_part(playerFacialHairDown, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairDown != -1) draw_sprite_part(playerHairDown, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHelmetDown != -1) draw_sprite_part(playerHelmetDown, image_index, 0, 0, 64, 64, x-32, y-100);
            }    
            else {
            	if (playerBaseDownIdle != -1) draw_sprite_part(playerBaseDownIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerLegClothesDownIdle != -1) draw_sprite_part(playerLegClothesDownIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerTorsoClothesDownIdle != -1) draw_sprite_part(playerTorsoClothesDownIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerFacialHairDownIdle != -1) draw_sprite_part(playerFacialHairDownIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHairDownIdle != -1) draw_sprite_part(playerHairDownIdle, image_index, 0, 0, 64, 64, x-32, y-64);
                if (playerHelmetDownIdle != -1) draw_sprite_part(playerHelmetDownIdle, image_index, 0, 0, 64, 64, x-32, y-100);
            }
        break;
    #endregion facing down
}

#endregion draw character parts