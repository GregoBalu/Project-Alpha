for (var _i = 0; _i < array_length(lesser_tentacles); ++_i)
{
    if (instance_exists(lesser_tentacles[_i])) {
        instance_destroy(lesser_tentacles[_i]);
    } else if (instance_exists(for_show_tentacles[_i])) {
        instance_destroy(for_show_tentacles[_i]);
    }
}