// Inherit the parent event
event_inherited();

var _prev_tentacles = lesser_tentacles_remaining;
lesser_tentacles_remaining = 0;
for (var _i = 0; _i < array_length(lesser_tentacles); ++_i)
{
    if (instance_exists(lesser_tentacles[_i])) {
        ++lesser_tentacles_remaining;
    } else if (instance_exists(for_show_tentacles[_i])) {
        instance_destroy(for_show_tentacles[_i]);
    }
}