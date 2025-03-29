
enum State { Closed, Opening, Open, Closing };
state = State.Closed;
global.do_draw_adventure_gui = true;
min_open_state = 30;
step_open = 8;
opening_state = min_open_state;
max_open_state = 316;

depth = 0;
talents = ds_list_create();
ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_heavy_cheap, {
    visible : false,
    depth : depth+10
}));
ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_def_hp, {
    visible : false,
    depth : depth+10
}));
ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_hp_dmg, {
    visible : false,
    depth : depth+10
}));
ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_light_crit, {
    visible : false,
    depth : depth+10
}));
ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_interrupt_armor_breaker, {
    visible : false,
    depth : depth+10
}));
ds_list_add(talents, instance_create_layer(0, 0, "GUI", obj_talent_wait_lifesteal, {
    visible : false,
    depth : depth+10
}));

openingSoundId = undefined;

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)