//collect target point
with (obj_rockshower) {
    if (is_target_for_manager) {
        ds_list_add(other.targets, self);
    }
}
if (DEBUG) show_debug_message($"Collected {ds_list_size(targets)} rockshowers");

alarm[0] = random_range(new_target_min, new_target_max);