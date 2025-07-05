event_inherited();


target_dir = random_range(0, 360);
bouncing_margin = 2;
skip_bounce_frame = 0;

generate_new_target = function() {
    
    if (bbox_left <= bouncing_margin) {
        target_dir = ((90 - target_dir) + 90 + random_range(0,30)) % 360;
    } else if (bbox_top <= bouncing_margin) {
        target_dir = ((0 - target_dir) + 0 + random_range(0,30)) % 360;
    } else if (bbox_right >= room_width-bouncing_margin) {
        target_dir = ((90 - target_dir) + 90 + random_range(0,30)) % 360;
    } else /*bbox_bottom >= room_height-bouncing_margin*/ {
        target_dir = ((0 - target_dir) + 0 + random_range(0,30)) % 360;
    }
    
}

onPathEnd = function() {
    alarm[0] = life;
}