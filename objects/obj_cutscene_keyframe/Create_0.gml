visible = false;
position = new Vec2(x, y);
enum Cutscene_KeyFrame_State { BeforeTransition, DuringTransition, AfterTransition, Disabled };
state = Cutscene_KeyFrame_State.BeforeTransition;

shroud_mask = shroud_clear_grid_setup(shroud_radius, obj_shroud.clear_grid_size);


transitionTo = function() {
    if (state == Cutscene_KeyFrame_State.BeforeTransition) {
        transition.tr_start(obj_camera.follow_point, position, obj_camera);
        
        state = Cutscene_KeyFrame_State.DuringTransition;
    }
}
