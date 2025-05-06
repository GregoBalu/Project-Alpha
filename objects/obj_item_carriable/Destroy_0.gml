if (carried_by != noone) {
    item_drop(carried_by);
}

if (lastShowState) {
    --obj_gui.show_use;
    lastShowState = false;
}