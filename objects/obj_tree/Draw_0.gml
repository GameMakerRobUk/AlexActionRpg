if (_currentSprite = spr_tree) {
    draw_sprite_ext(_currentSprite, _growthStage, x, y, 1, 1, 0, image_blend, 1);
}
else {
    draw_sprite_ext(_currentSprite, _growthStage, x, y, 1, 1, 0, c_white, 1);
} 