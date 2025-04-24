#region -------------------------------------random movement---------------------------------------------------
    
    if (fixedLocation = false) { 
        idle = false;
        moveDirection = choose(0, 1, 2, 3);
         
        switch (moveDirection) {
        	case 0 :
                facing = 0;
                _horizontal = 1;
                _vertical = 0;
            break
            case 1 :
                facing = 90;
                _horizontal = 0;
                _vertical = -1;
            break
            case 2 :
                facing = 180;
                _horizontal = -1;
                _vertical = 0;
            break
            case 3 :
                facing = 270;
                _horizontal = 0;
                _vertical = 1;
            break
        }
        
    randomWalkingTime = random_range(50, 100);
    alarm[2] = randomWalkingTime; 
      
    }
    else { 
        idle = true;
    }         
    
#endregion random movement