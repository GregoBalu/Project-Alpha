
if (state == Cutscene_KeyFrame_State.DuringTransition) {
    transition.tr_step(obj_camera);
    
    if (transition.is_finished()) {
        transition.tr_end(obj_camera);
        state = Cutscene_KeyFrame_State.AfterTransition;
    }
} else if(state == Cutscene_KeyFrame_State.AfterTransition) {
    
    duration--;
    if (duration <= 0) {
        state = Cutscene_KeyFrame_State.Disabled;
        
        if (next_keyframe != undefined) {
            next_keyframe.transitionTo();
        } else {
            obj_camera.follow_player = true;
            obj_player.immobilized = false;
        }
        
        shroud_set_fog_around(position.x, position.y, (shroud_radius+1)*obj_shroud.grid_size);
        instance_destroy();
    }
}