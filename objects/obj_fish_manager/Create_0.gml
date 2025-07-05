enum FishState { PreBait, PostBait, PreDrop, Exploded };
state = FishState.PreBait;

bait = noone;
fish = noone;
target = noone;

room_margin = 8;

fish_caught = 0;


returnRoom = function() {
    room_goto(obj_fish_switcher.original_room);
}

fishBaited = function() {
    fish = instance_create_layer(bait.x, bait.y, "Instances", obj_fish_fish);

    instance_destroy(bait);
    bait = noone;
    
    target = instance_create_layer(random_range(16, room_width-16), random_range(16, room_height-16), "Instances", obj_fish_target);
    
    state = FishState.PreDrop;
    
    alarm[2] = random_range(3, 6)*TIME_SECOND;
}

dropTnt = function() {
    alarm[2] = 0;
    instance_destroy(target);
    target = noone;
    fish.enabled = false;

    var _last = new Vec2(path_get_point_x(pth_fish_tnt, 2), path_get_point_y(pth_fish_tnt, 2));
    var _dist = _last.distance(new Vec2(fish.x, fish.y));
    
    path_delete_point(pth_fish_tnt, 3);
    path_add_point(pth_fish_tnt, fish.x, fish.y, _dist>100?300:150);

    instance_create_layer(0, 0, "Instances", obj_fish_tnt, {
        path: pth_fish_tnt
    })

    
}

tntExploded = function() {
    state = FishState.Exploded;
    instance_destroy(fish);
    fish = noone;
    
    fish_caught++;
    obj_fish_switcher.fish_caught = fish_caught;
    inst_textbox_fish_caught.text = $"{fish_caught}";
    alarm[1] = TIME_SECOND;
}
