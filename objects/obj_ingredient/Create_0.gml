// Inherit the parent event
event_inherited();

onBrew = function() {}

disable = function() {
    if (carried_by != noone) {
        item_drop(carried_by);
    }
    
    if (lastShowState) {
        --obj_gui.show_use;
        lastShowState = false;
    }
    
    x = 0;
    y = 0;
    visible = false;
    can_pickup = false;
}