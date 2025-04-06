function scr_drawSpriteParts() {
    if(facing = 0)
    {
        //instanceSpriteBase = instanceSpriteBaseRight;
        //instanceSpriteHair = instanceSpriteHairRight;
        //instanceSpriteFacialHair = instanceSpriteFacialHairRight;
        instanceSpriteLegClothes = spr_male1_blueBreechesRight;
        //instanceSpriteChestClothes = instanceSpriteChestClothesRight;
        //instanceSpriteShadow = instanceSpriteShadowVertical;
    
        //currentSpriteAnimationSpeed = spriteAnimationSpeed;

    }
    /*
    else if(facing = 180)
    {
        instanceSpriteBase = instanceSpriteBaseLeft;
        instanceSpriteHair = instanceSpriteHairLeft;
        instanceSpriteFacialHair = instanceSpriteFacialHairLeft;
        instanceSpriteLegClothes = instanceSpriteLegClothesLeft;
        instanceSpriteChestClothes = instanceSpriteChestClothesLeft;
        instanceSpriteShadow = instanceSpriteShadowVertical;
    
        currentSpriteAnimationSpeed = spriteAnimationSpeed;

    }
    else if(facing = 90)
    {
        instanceSpriteBase = instanceSpriteBaseDown;
        instanceSpriteHair = instanceSpriteHairDown;
        instanceSpriteFacialHair = instanceSpriteFacialHairDown;
        instanceSpriteLegClothes = instanceSpriteLegClothesDown;
        currentSpriteAnimationSpeed = spriteAnimationSpeed;	
        instanceSpriteChestClothes = instanceSpriteChestClothesDown;
        instanceSpriteShadow = instanceSpriteShadowHorizontal;
    
        currentSpriteAnimationSpeed = spriteAnimationSpeed;
    }
    else if(facing = 270)
    {
        instanceSpriteBase = instanceSpriteBaseUp;
        instanceSpriteHair = instanceSpriteHairUp;
        instanceSpriteFacialHair = instanceSpriteFacialHairUp;
        instanceSpriteLegClothes = instanceSpriteLegClothesUp;
        instanceSpriteChestClothes = instanceSpriteChestClothesUp;
        instanceSpriteShadow = instanceSpriteShadowHorizontal;
    
        currentSpriteAnimationSpeed = spriteAnimationSpeed;
    }

    //If none of the movement buttons are pressed stop animating the sprite and set it back to frame 0
    if (!max(movingRight, movingLeft, movingDown, movingUp))
    {
            currentSpriteAnimationSpeed = 0;
            spriteSubImage = 0;
    }

    var xx = x-collisionMask_xOffset;
    var yy = y-collisionMask_yOffset-5;

    if(spriteSubImage +(currentSpriteAnimationSpeed / room_speed * spriteAnimationMultiplier) < spriteAnimationLenght)
    {
        spriteSubImage += currentSpriteAnimationSpeed / room_speed * spriteAnimationMultiplier;
    }
    else
    {
        spriteSubImage = 0;
    }
*/
    //Draw character shadow
    //draw_sprite(instanceSpriteShadow, 0, x, y)

    //Draw character base
    //draw_sprite_part(instanceSpriteBase, floor(spriteSubImage), spriteAnimationFrame_x, spriteAnimationFrame_y, 64, 64, xx, yy);

    //Draw character feet

    //Draw character legs
    draw_sprite_part(instanceSpriteLegClothes, floor(spriteSubImage), spriteAnimationFrame_x, spriteAnimationFrame_y, 64, 64, xx, yy);

    //Draw character chest clothes
    //draw_sprite_part(instanceSpriteChestClothes, floor(spriteSubImage), spriteAnimationFrame_x, spriteAnimationFrame_y, 64, 64, xx, yy);

    //Draw character chest armor

    //Draw character belt

    //Draw character facial hair
    //draw_sprite_part(instanceSpriteFacialHair, floor(spriteSubImage), spriteAnimationFrame_x, spriteAnimationFrame_y, 64, 64, xx, yy);

    //Draw character hair
    //draw_sprite_part(instanceSpriteHair, floor(spriteSubImage), spriteAnimationFrame_x, s

}