event_inherited();

if (following_path) exit;
    
if (skip_bounce_frame == 0 && (bbox_left <= bouncing_margin || bbox_top <= bouncing_margin || bbox_right >= room_width-bouncing_margin || bbox_bottom >= room_height-bouncing_margin)) {
    generate_new_target();
    skip_bounce_frame = 10;
}

if (skip_bounce_frame > 0) {
    skip_bounce_frame--;
}

speed = 1;
direction = target_dir;

if (distance_to_object(obj_fish_target) <= 2) {
    //show_debug_message("Ball Pushed")
    var _dist = 2;
    var _dir = point_direction(x, y, obj_fish_target.x, obj_fish_target.y);
    with (obj_fish_target) {
        move_and_collide(lengthdir_x(_dist, _dir), lengthdir_y(_dist, _dir), [], undefined, undefined, undefined, _dist, _dist);
    }
}