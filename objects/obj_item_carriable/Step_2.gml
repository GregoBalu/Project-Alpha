if (carried_by != noone) {
    
    var _xoffset = 0;
    var _yoffset = 0;
    depth = carried_by.depth - 1;
    if (carried_by.orientation == Orientation.DOWN) {
        _xoffset = lengthdir_x(offset, 270);
        _yoffset = lengthdir_y(offset, 270);
    } else if (carried_by.orientation == Orientation.DOWNLEFT) {
        _xoffset = lengthdir_x(offset, 225);
        _yoffset = lengthdir_y(offset, 225);
    } else if (carried_by.orientation == Orientation.LEFT) {
        _xoffset = lengthdir_x(offset, 180);
        _yoffset = lengthdir_y(offset, 180);
    } else if (carried_by.orientation == Orientation.UPLEFT) {
        _xoffset = lengthdir_x(offset, 135);
        _yoffset = lengthdir_y(offset, 135);
        depth = carried_by.depth + 1;
    } else if (carried_by.orientation == Orientation.UP) {
        _xoffset = lengthdir_x(offset, 90);
        _yoffset = lengthdir_y(offset, 90);
        depth = carried_by.depth + 1;
    } else if (carried_by.orientation == Orientation.UPRIGHT) {
        _xoffset = lengthdir_x(offset, 45);
        _yoffset = lengthdir_y(offset, 45);
        depth = carried_by.depth + 1;
    } else if (carried_by.orientation == Orientation.RIGHT) {
        _xoffset = lengthdir_x(offset, 0);
        _yoffset = lengthdir_y(offset, 0);
    } else if (carried_by.orientation == Orientation.DOWNRIGHT) {
        _xoffset = lengthdir_x(offset, 315);
        _yoffset = lengthdir_y(offset, 315);
    }
    
    x = carried_by.x + _xoffset ;//-sprite_width/2;
    y = carried_by.y + _yoffset ;//-sprite_height/2;
}

_background_sprite_time++;