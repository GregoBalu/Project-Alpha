if (visible) {
    time_start += delta_time;
    
    if (time_start % (jiggle_frequency * TIME_SECOND) == 0) {
        x = xstart + random_range(-max_jiggle_x, max_jiggle_x);
        y = ystart + random_range(-max_jiggle_y, max_jiggle_y);
    }
    
} else {
    time_start = 0;
}