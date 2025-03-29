ds_grid_destroy(default_shroud_mask);

for (var k = ds_map_find_first(blocking_shroud_mask_map); !is_undefined(k); k = ds_map_find_next(blocking_shroud_mask_map, k)) {
    var v = blocking_shroud_mask_map[? k];
    /* Use k, v here */
    ds_grid_destroy(v);
}
ds_map_destroy(blocking_shroud_mask_map);

ds_list_destroy(unlocked_talents);
ds_map_destroy(inventory);
ds_map_destroy(equipped_items);

close_stats_gather_file();