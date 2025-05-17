if (paused) {
    exit;
}

var _len = point_distance(x, y, xstart, ystart);
if (_len >= path_distance) {
    restart();
    exit;
}

x += lengthdir_x(ball_speed/TIME_SECOND, path_direction);
y += lengthdir_y(ball_speed/TIME_SECOND, path_direction);

