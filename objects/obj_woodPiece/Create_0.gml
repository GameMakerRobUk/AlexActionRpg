// Inherit the parent event
event_inherited();

i_died = function(){
    instance_destroy();
}

//Set random branch size sprite
frame = random_range(0, 3);
if (frame < 1) {
    image_index = 0;
}
else if (frame < 2) {
    image_index = 1;
}
else if (frame < 3) {
    image_index = 2;
}