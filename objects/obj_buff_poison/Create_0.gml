// Inherit the parent event
event_inherited();

//targetObject

targetObject.image_blend = c_green;

if (dot_tickrate_seconds != 0) {
    dot_ticks = (duration_seconds / dot_tickrate_seconds);
} else {
    dot_ticks = 1;
}

alarm[1] = dot_tickrate_seconds*TIME_SECOND;