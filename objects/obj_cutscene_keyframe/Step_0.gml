
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
        
        shroud_set_fog_around(position.x, position.y, (shroud_radius+1)*obj_shroud.grid_size);
        if (next_keyframe != undefined) {
            next_keyframe.transitionTo();
        } else {
            obj_camera.follow_player = true;
            obj_player.immobilized = false;
            
            shroud_clear_position(obj_player.x, obj_player.y, obj_player.no_see_tilemaps, obj_player.current_shroud_mask);
        }
        
        instance_destroy();
    }
}