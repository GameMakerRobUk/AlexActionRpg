#region taking damage and dying
    if (alarm[0] < 0) 
        {
            hp -= max(0, other.damage);       
            alarm[0] = 60;
            image_blend = c_red; 
            
            if (hp <= 0)  
            {
                //if no allies are conscious, then scenario selected based on environment and what got you----------
                room_restart();        
            }
        }
#endregion taking damage and dying