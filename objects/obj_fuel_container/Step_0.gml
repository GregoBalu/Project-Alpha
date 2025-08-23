// Inherit the parent event
event_inherited();

if (fill_level > 0) {
    if (image_index != 1) {
        image_index = 1;
    }
    fill_level -= spill_amount;
    spilled_amount += spill_amount;
    //show_debug_message($"Fuel container level: {fill_level}");
    if (carried_by != noone) {
        
        if (fill_level > max_fill_level*0.9) {
            //label = "100%";
        } else if (fill_level > max_fill_level*0.60) {
            //label = "75%";
        } else if (fill_level > max_fill_level*0.3) {
            //label = "50%";
        } else if (fill_level > max_fill_level*0.1) {
            //label = "25%";
        } else if (fill_level > 0) {
            //label = "1%";
        } else {
            //label = "0%";
        }
    }
    
    if (spilled_amount >= 10) {
        spilled_amount = 0;
        instance_create_layer(x, y, "Items", obj_fuel_spillage, {
            timeSeconds: 2,
            parent: id
        });
    }
} else {
    if (image_index != 0) {
        image_index = 0;
    }
}