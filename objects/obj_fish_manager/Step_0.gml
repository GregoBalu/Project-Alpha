if (state == FishState.PreBait) {
    
    if (mouse_check_button_pressed(mb_left)) {
        
        var _path = path_add();
        path_set_kind(_path, 1);
        path_set_closed(_path, false);
        path_add_point(_path, room_width, random_range(0.2*room_height, 0.8*room_height), 200);
        path_add_point(_path, mouse_x, mouse_y, 200);
        
        
        bait = instance_create_layer(0, 0, "Instances", obj_fish_bait, {
            path: _path,
            destroy_path: true
        });
        state = FishState.PostBait;
    }
}