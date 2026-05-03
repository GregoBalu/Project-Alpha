// Inherit the parent event
event_inherited();

onFollowTarget = function() {}
follow_target = noone;
set_follow_target = function(_target) {
    show_debug_message($"Following {_target}");
    follow_target = _target;
    if (follow_target != noone) {
        do_wander = false;
        alarm[NPCAlarms.Wandering_Update] = 0;
    } else {
        do_wander = true;
        wander_origin_x = x;
        wander_origin_y = y;
        alarm[NPCAlarms.Wandering_Update] = TIME_SECOND;
    }
    onFollowTarget();
}