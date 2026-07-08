//gain_experience(obj_enemy1);
//coins++;
//gain_talent(1);
//immobilized = !immobilized;
//instance_create_layer(0, 0, "Instances", obj_cutscene_base);

//obj_cutscene_keyframe.transitionTo();
//test_join.x += 2;

//change_room_to(rm_cave, RoomTransition.Spin);

var _prev = shroud_radius_extra;
shroud_radius_extra = clamp(shroud_radius_extra+0.5, 0, shroud_radius_extra_max);
if (_prev != shroud_radius_extra) {
    show_debug_message($"extra shroud radius={shroud_radius_extra}, final={shroud_radius()}");
    generate_shroud_masks();
}
