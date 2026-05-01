//spawn floating stuff
var _side = choose(0, 1);//left / right

var _target_x = 0;
var _target_y = random_range(16, room_height-16);

if (_side == 0) {
    _target_x = random_range(16, 32);
} else {
    _target_x = random_range(room_width-32, room_width-16);
}

var _isLate = (fish_time>300);

var _life = (_isLate)?(6*TIME_SECOND):(random_range(3, 6)*TIME_SECOND);

var _ball = instance_create_layer(_target_x, _target_y, "Instances", obj_fish_ball, {
    throw_side: _side,
    target_x: _target_x,
    target_y: _target_y,
    life: _life
});

alarm[2] = _isLate?TIME_SECOND:(random_range(1, 4)*TIME_SECOND);