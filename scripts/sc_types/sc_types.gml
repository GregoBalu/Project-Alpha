


/**
 * Vector 2
 * @param {Real} _x X coordinate of the vector
 * @param {Real} _y Y coordinate of the vector
 */
function Vec2(_x, _y) constructor {
    x = _x;
    y = _y;
    
    
    /**
     * Returns the direction to another Vec2
     * @param {Vec2} _other The other Vec2 to compare to.
     * @returns {Real} Direction of the other Vec2 compared to this Vec2.
     */ 
    direction = function(_other) {
        return point_direction(x, y, _other.x, _other.y);
    }
    
    add = function(_len_x, _len_y, _dir) {
        var _diff_x = lengthdir_x(_len_x, _dir);
        var _diff_y = lengthdir_y(_len_y, _dir);
        return new Vec2(x+_diff_x,y+_diff_y);
    }
    
    add = function(vec2) {
        return new Vec2(x+vec2.x, y+vec2.y);
    }
    
    rotateAntiClockwise = function(_deg) {
        var old_x = x;
        var old_y = y;
        var cos_v = cos(_deg);
        var sin_v = sin(_deg);
        
        x = old_x*cos_v - old_y*sin_v;
        y = old_x*sin_v + old_y*cos_v;
    }
    
    /**
     * Returns the distance from this point to another point.
     * @param {Vec2} _other The other Vec2 to compare to.
     * @returns {Real} The distance.
     */
    distance = function(_other) {
        return point_distance(x, y, _other.x, _other.y);
    }
    
    toString = function() {
        return $"({x},{y})";
    }
}

enum Orientation { UP, UPRIGHT, RIGHT, DOWNRIGHT, DOWN, DOWNLEFT, LEFT, UPLEFT };
function dir2Orientation(_dir) {
    _dir = _dir mod 360;
    if (337.5 <= _dir || _dir <= 22.5) {
        return Orientation.RIGHT;
    } else if (22.5 < _dir && _dir < 67.5) {
        return Orientation.UPRIGHT;
    } else if (67.5 <= _dir && _dir <= 112.5) {
        return Orientation.UP;
    } else if (112.5 < _dir && _dir < 157.5) {
        return Orientation.UPLEFT;
    } else if (157.5 <= _dir && _dir <= 202.5) {
        return Orientation.LEFT;
    } else if (202.5 < _dir && _dir < 247.5) {
        return Orientation.DOWNLEFT;
    } else if (247.5 <= _dir && _dir <= 292.5) {
        return Orientation.DOWN;
    } else if (292.5 < _dir && _dir < 337.5) {
        return Orientation.DOWNRIGHT;
    }
}
function Orientation2Str(_ori) {
    switch (_ori) {
        case Orientation.UP:
            return "UP";
        case Orientation.UPRIGHT:
            return "UPRIGHT";
        case Orientation.UPLEFT:
            return "UPLEFT";
        case Orientation.RIGHT:
            return "RIGHT";
        case Orientation.DOWNRIGHT:
            return "DOWNRIGHT";
        case Orientation.DOWN:
            return "DOWN";
        case Orientation.DOWNLEFT:
            return "DOWNLEFT";
        case Orientation.LEFT:
            return "LEFT";
    }
}

/**
 * Function Description
 * @param {Vec2} _p1 Point 1
 * @param {Vec2} _p2 Point 2
 * @param {Vec2} _p3 Point 3
 */
function Triangle(_p1, _p2, _p3) constructor {
    a = _p1;
    b = _p2;
    c = _p3;
    
    /**
     *
     * @param {Vec2} _p Point to check if it's inside of the triangle or not
     * @returns {Bool} True if the point is inside of the triangle.
     */
    function is_point_in(_p) {
        return point_in_triangle(_p.x, _p.y, a.x, a.y, b.x, b.y, c.x, c.y);
    }
    function cleanup() {
        delete a;
        delete b;
        delete c;
    }
}
