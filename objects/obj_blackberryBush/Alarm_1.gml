// Inherit the parent event
event_inherited();

if (_currentSprite == spr_bushStump && stumpHp <= 0) {
    instance_destroy(); 
}