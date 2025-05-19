// Inherit the parent event
event_inherited();

var _prev_tentacles = lesser_tentacles_remaining;
lesser_tentacles_remaining = 0;
for (var _i = 0; _i < array_length(lesser_tentacles); ++_i)
{
    if (instance_exists(lesser_tentacles[_i])) {
        ++lesser_tentacles_remaining;
    }
}
if (lesser_tentacles_remaining != _prev_tentacles) {
    if (lesser_tentacles_remaining == 0) {
        instance_destroy(for_show_tentacles[1]);
    } else if (lesser_tentacles_remaining == 1) {
        instance_destroy(for_show_tentacles[0]);
    }
}