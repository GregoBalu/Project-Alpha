if (!enabled) exit;

if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_fish_fish, false, true) != noone) {
    if (progress < max_progress) {
        progress = clamp(progress+1, 0, max_progress);
    }
} else {
    if (progress > 0) {
        progress = clamp(progress-0.5, 0, max_progress);
    }
}

var _hor = (keyboard_check(global.input_right)?1:0) - (keyboard_check(global.input_left)?1:0);
var _ver = (keyboard_check(global.input_down)?1:0) - (keyboard_check(global.input_up)?1:0);

move_and_collide(_hor, _ver, collision_array, undefined, undefined, undefined, 1, 1);
x = clamp(x, obj_fish_manager.room_margin, room_width-obj_fish_manager.room_margin);
y = clamp(y, obj_fish_manager.room_margin, room_height-obj_fish_manager.room_margin);

if (progress >= max_progress) {
    if (mouse_check_button_pressed(mb_left)) {
        enabled = false;
        progress = 0;
        visible = false;
        obj_fish_manager.dropTnt();
    }
}

var prog_prec = progress/max_progress;
var _innerLerp = lerp(0.2, 0.3, prog_prec);
var _outerLerp = lerp(1, 1+(prog_prec*0.3), (sin(_innerLerp*time)+1) /2);

image_xscale = _outerLerp;
image_yscale = _outerLerp;

time++;
if (time > 10000000) {
    time = 0;
}