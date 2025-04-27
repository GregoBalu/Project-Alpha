// Inherit the parent event
event_inherited();

image_speed = 0;
image_index = 0;

itemsLayer = layer_get_id("Instances");

xcenter = x + sprite_width/2;
ycenter = y + sprite_height/2;

if (loottable == noone) {
    show_debug_message($"No loottable set for chest {id} / {instance_id}");
}


function onInterract() {
    image_index = 1;
    
    //empty contents
    if (loottable == noone) {
        exit;
    }
    loottable.generate_loot(random_range(bbox_left, bbox_right), random_range(ycenter, bbox_bottom), itemsLayer)
    
}