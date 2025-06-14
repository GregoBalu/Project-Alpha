// Inherit the parent event
event_inherited();

//targetObject

do_statistic = (targetObject.object_index == obj_player);

if (hot_tickrate_seconds != 0) {
    hot_ticks = duration_seconds / hot_tickrate_seconds;
} else {
    hot_ticks = 1;
}
alarm[1] = hot_tickrate_seconds*TIME_SECOND;