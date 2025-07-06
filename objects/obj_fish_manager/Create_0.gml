enum FishState { PreBait, PostBait, PreDrop, Exploded };
state = FishState.PreBait;

bait = noone;
fish = noone;
target = noone;

room_margin = 8;

fish_caught = 0;
fish_missed = 0;

obj_fish_switcher.fish_caught = 0;
obj_fish_switcher.fish_missed = 0;


returnRoom = function() {
    room_goto(obj_fish_switcher.original_room);
}

fishBaited = function() {
    fish = instance_create_layer(bait.x, bait.y, "Instances", obj_fish_fish);

    instance_destroy(bait);
    bait = noone;
    
    target = instance_create_layer(random_range(16, room_width-16), random_range(16, room_height-16), "Instances", obj_fish_target);
    
    state = FishState.PreDrop;
    
    alarm[2] = random_range(1, 4)*TIME_SECOND;
}

dropTnt = function() {
    alarm[2] = 0;
    instance_destroy(target);
    target = noone;
    fish.enabled = false;

    instance_create_layer(0, 0, "Instances", obj_fish_tnt, {
        target_x: fish.x,
        target_y: fish.y
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

fishGotAway = function() {
    alarm[2] = 0;
    instance_destroy(target);
    target = noone;
    fish = noone;
    fish_missed++;
    obj_fish_switcher.fish_missed = fish_missed;
    state = FishState.Exploded;
    alarm[1] = TIME_SECOND;
}
