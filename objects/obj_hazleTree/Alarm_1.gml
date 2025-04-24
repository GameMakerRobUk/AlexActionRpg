// Inherit the parent event
event_inherited();

if (_currentSprite == spr_hazleTreeStump && stumpHp <= 0) {
    instance_destroy(); 
}
