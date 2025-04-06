draw_self();
if (toolEquipped == 4) {
    draw_set_color(c_yellow);
    if (facing == 270) {
        draw_rectangle(x -16, y, x +15, y +31, true);
    }
    else if (facing == 90) {
        draw_rectangle(x -16, y, x +15, y -32, true);
    }
    else if (facing == 180) {
        draw_rectangle(x, y -16 , x -32, y +15 , true);
    }
    else if (facing == 0) {
        draw_rectangle(x, y -16 , x +31, y +16 , true);
    }
}
draw_set_color(c_red);

/*draw_set_color(c_purple);
draw_rectangle(_x - 16, _y - 31, _x + 15, _y +31, true) ;*/
