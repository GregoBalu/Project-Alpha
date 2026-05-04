// Inherit the parent event
event_inherited();

onFollowTarget = function() {
    //override me
}

follow_target = noone;
set_follow_target = function(_target) {
    
    follow_target = _target;
    if (follow_target != noone) {
        do_wander = false;
        alarm[NPCAlarms.Wandering_Update] = 0;
        if (DEBUG) show_debug_message($"Following {_target}");
    } else {
        do_wander = true;
        wander_origin_x = x;
        wander_origin_y = y;
        alarm[NPCAlarms.Wandering_Update] = TIME_SECOND;
        if (DEBUG) show_debug_message($"Following stopped");
    }
    onFollowTarget();
}