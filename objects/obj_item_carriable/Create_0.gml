// Inherit the parent event
event_inherited();

isInCollision = false;
lastShowState = false;

carried_by = noone;
//xoffset = 0;
//yoffset = 0;
offset = 0;
originalDepth = depth;

_background_sprite_time = 0;
_background_sprite_fps = 6;
_background_sprite_refresh_rate = 60/_background_sprite_fps;


function item_pickup(_othr) {
    
    show_debug_message("Pickup carry");
    carried_by = _othr;
    carried_by.pickedUpItem(self);
    //xoffset = x - carried_by.x;
    //yoffset = y - carried_by.y;
    offset = point_distance(carried_by.x, carried_by.y, x, y);
    depth = carried_by.depth - 1;
    
}

function item_drop(_othr) {
    show_debug_message("Drop carry");
    carried_by.droppedItem(self);
    carried_by = noone;
    depth = originalDepth;
}
