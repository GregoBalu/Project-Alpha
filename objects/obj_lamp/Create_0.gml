// Inherit the parent event
event_inherited();

is_on = false;
glow_obj = noone;

function SwitchOn() {
    if (is_on) exit;
    
    is_on = true;
    glow_obj = instance_create_depth(x, y, depth+1, obj_light_point, {
        max_pulse_scale: 0.15,
        frequency_seconds: 0.08,
        image_xscale: 0.22,
        image_yscale: 0.22,
        image_blend: #FF7040
    })
}

function SwitchOff() {
    if (!is_on) exit;
    
    if (glow_obj != noone) {
        instance_destroy(glow_obj);
        glow_obj = noone;
    }
    is_on = false;
}
    
function Toggle() {
    if (is_on) {
        SwitchOff();
    } else {
        SwitchOn();
    }
}