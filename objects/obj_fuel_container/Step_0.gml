// Inherit the parent event
event_inherited();

if (fill_level > 0) {
    if (image_index != 1) {
        image_index = 1;
    }
    fill_level -= spill_amount;
    spilled_amount += spill_amount;
    show_debug_message($"Fuel container level: {fill_level}");
    
    if (spilled_amount >= 10) {
        spilled_amount = 0;
        instance_create_layer(x, y, "Items", obj_fuel_spillage, {
            timeSeconds: 2
        });
    }
} else {
    image_index = 0;
}