// Inherit the parent event
event_inherited();

show_use = false;
visible = false;
should_be_visible = false;

cx = (bbox_left + bbox_right) / 2;
cy = (bbox_top + bbox_bottom) / 2;

if (other_end == noone) {
    show_debug_message($"Ladder without other end: {id} @ {x},{y}");
}