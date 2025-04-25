event_inherited();

i_died = function(){
    instance_destroy();
}

frame = irandom( 4);
if (frame < 1) {
    image_index = 0;
}
else if (frame < 2) {
    image_index = 1;
}
else if (frame < 3) {
    image_index = 2;
}
else if (frame <= 4) {
    image_index = 3;
}