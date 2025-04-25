// Inherit the parent event
event_inherited();

i_died = function(){
    instance_destroy();
}

//Set random branch size sprite
_frame = irandom(2); 
image_index = _frame;
