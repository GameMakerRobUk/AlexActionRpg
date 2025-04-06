// Inherit the parent event
event_inherited();

if (_currentSprite == spr_treeStump && stumpHp <= 0) {
    instance_destroy(); 
}
