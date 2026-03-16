visible = false;
if (!align_player) {
    position = new Vec2(x, y);
} else {
    position = new Vec2(obj_player.x, obj_player.y);
}
enum Cutscene_KeyFrame_State { BeforeTransition, DuringTransition, AfterTransition, Disabled };
state = Cutscene_KeyFrame_State.BeforeTransition;

shroud_mask = shroud_clear_grid_setup(shroud_radius, obj_shroud.clear_grid_size);


transitionTo = function() {
    if (state == Cutscene_KeyFrame_State.BeforeTransition) {
        if (align_player) {
            delete position;
            position = new Vec2(obj_player.x, obj_player.y);
        } else {
            shroud_set_fog_around(position.x, position.y, (shroud_radius+1)*obj_shroud.grid_size);
            shroud_clear_position(position.x, position.y, obj_player.no_see_tilemaps, shroud_mask);
        }
        
        transition.tr_start(obj_camera.follow_point, position, obj_camera);
        
        state = Cutscene_KeyFrame_State.DuringTransition;
    }
}
