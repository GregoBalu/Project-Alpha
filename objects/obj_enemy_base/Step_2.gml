if (MOVING) {
    if (!animation.isFirstStand) {
        animation.isFirstStand = true;
    }
    if (xprevious != x || yprevious != y) {
        var _dir = point_direction(xprevious, yprevious, x, y);
        var _new_ori = dir2Orientation(_dir);
        if (orientation != _new_ori) {
            orientation = _new_ori;
            if (DEBUG) {
                show_debug_message($"New orientation: {Orientation2Str(orientation)}, {_dir}");
            }
            switch (orientation) {
                case Orientation.DOWN:
                case Orientation.DOWNRIGHT:
                case Orientation.DOWNLEFT:
                    sprite_index = animation.walk_down;
                    break;
                case Orientation.RIGHT:
                    sprite_index = animation.walk_right;
                    break;
                case Orientation.LEFT:
                    sprite_index = animation.walk_left;
                    break;
                case Orientation.UP:
                case Orientation.UPRIGHT:
                case Orientation.UPLEFT:
                    sprite_index = animation.walk_up;
                    break;
            }
        }
    }
} else if (!MOVING) {
    if (animation.isFirstStand) {
        if (DEBUG) {
            show_debug_message($"Enemy standing");
        }
        animation.isFirstStand = false;
        sprite_index = animation.idle_stand;
        image_index = 0;
    }
}