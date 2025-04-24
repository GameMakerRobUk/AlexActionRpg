#region -----------------------------------------moving----------------------------------------------------
    
    	depth = -y;
        switch (facing) {
        	case 0 :
                move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemapEnvironment, tilemapBuilding, obj_parCollision, obj_player], undefined, undefined, undefined, move_speed, move_speed);
            break  
            case 90 :
                move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemapEnvironment, tilemapBuilding, obj_parCollision, obj_player], undefined, undefined, undefined, move_speed, move_speed);
            break
            case 180 :
                move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemapEnvironment, tilemapBuilding, obj_parCollision, obj_player], undefined, undefined, undefined, move_speed, move_speed);
            break
            case 270 :
                move_and_collide(_horizontal * move_speed, _vertical * move_speed, [tilemapEnvironment, tilemapBuilding, obj_parCollision, obj_player], undefined, undefined, undefined, move_speed, move_speed);
            break  
        }
    
#endregion moving