if (distance_to_object(obj_player) > 64) exit;

if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true)) {
     if (!showUse) {
        obj_gui.show_use++;
        showUse = true;
    }
    
    if (keyboard_check_pressed(global.input_use)) {
        var _inst = instance_create_layer(0, 0, "Instances", obj_fish_switcher);
        _inst.original_room = room;
        room_goto(rm_fish);
    }
} else {
    if (showUse) {
        obj_gui.show_use--;
        showUse = false;
    }
}