
opened = false;
visible = true;
showed_use = false;

image_blend = keyColor2Color(door_color);

if (!instance_exists(activate_inst)) {
    show_debug_message("Empty activate_inst for instance object {0}, object: {1}", id, object_index);
}

_background_sprite_time = 0;
_background_sprite_fps = 6;
_background_sprite_refresh_rate = TIME_SECOND/_background_sprite_fps;

On = function(_inst_id) {
    
    
    opened = true;
    if (showed_use) {
        showed_use = false;
        obj_gui.show_use--;
    }
    
    if (instance_exists(activate_inst)) {
        activate_inst.On(id);
    }
};
Off = function(_inst_id) {
    
};