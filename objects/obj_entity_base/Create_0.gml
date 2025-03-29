default_move_speed = move_speed;
default_depth = depth;
MOVING = false;

tilemap = layer_tilemap_get_id("Tiles_Col");

if (hp_total == 0) {
    hp_total = hp;
}

is_holding_item = false;
held_item = undefined;
function pickedUpItem(_item) {
    is_holding_item = true;
    held_item = _item;
}

function droppedItem(_item) {
    is_holding_item = false;
    held_item = undefined;
}
