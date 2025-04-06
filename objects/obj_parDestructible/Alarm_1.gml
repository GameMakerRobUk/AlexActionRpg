image_blend = c_white;

if (hp <= 0) 
{
    i_died();       
}
if (_currentSprite == spr_treeStump && stumpHp <= 0) {
    instance_destroy(); 
}
