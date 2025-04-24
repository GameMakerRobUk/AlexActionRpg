/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player){
                switch (obj_player.facing) {
            case 0:   x = obj_player.x + 8; y = obj_player.y; break;
            case 90:  x = obj_player.x; y = obj_player.y - 8; break; // up
            case 180: x = obj_player.x - 8; y = obj_player.y; break; // left
            case 270: x = obj_player.x; y = obj_player.y + 8; break; // down
        }
}

depth = -10000;