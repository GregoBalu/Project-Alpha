var switcher;
if (!instance_exists(obj_room_switcher)) {
    switcher = instance_create_layer(0, 0, "Instances", obj_room_switcher);
} else {
    switcher = obj_room_switcher;
}


room_goto(rm_cave);

