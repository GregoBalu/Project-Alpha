//spawn floating stuff
var _ball = instance_create_layer(random_range(room_margin, room_width-room_margin), random_range(room_margin, room_height-room_margin), "Instances", obj_fish_ball, {
    life: random_range(3, 6)*TIME_SECOND
});

alarm[2] = random_range(3, 6)*TIME_SECOND;