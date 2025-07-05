if (state == FishState.PreBait) {
    
    if (mouse_check_button_pressed(mb_left)) {

        bait = instance_create_layer(0, 0, "Instances", obj_fish_bait, {
            target_x: mouse_x,
            target_y: mouse_y
        });
        state = FishState.PostBait;
    }
}