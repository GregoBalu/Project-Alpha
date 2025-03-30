if (instance_exists(obj_dialog)) exit;

var _hor = (keyboard_check(global.input_right)?1:0) - (keyboard_check(global.input_left)?1:0);
var _ver = (keyboard_check(global.input_down)?1:0) - (keyboard_check(global.input_up)?1:0);
var sprint_modifier = keyboard_check(global.input_sprint)?1.5:1;

var _len = (_hor !=0 || _ver!=0);
var _dir = point_direction(0,0, _hor, _ver);
_hor = lengthdir_x(_len, _dir);
_ver = lengthdir_y(_len, _dir);

var _actual_move_speed = move_speed * sprint_modifier;

move_and_collide(_hor * _actual_move_speed, _ver * _actual_move_speed, tilemap, undefined, undefined, undefined, _actual_move_speed, _actual_move_speed);

//var _vmat = camera_get_view_mat(view_camera[0]);
audio_listener_set_position(0, x, y, 0);

var _is_on_hurt_tile = (tilemap_get_at_pixel(tilemap_hurt, x, y) != 0) || 
                        (tilemap_get_at_pixel(tilemap_hurt, bbox_left, y) != 0) ||
                        (tilemap_get_at_pixel(tilemap_hurt, bbox_right, y) != 0) || 
                        (tilemap_get_at_pixel(tilemap_hurt, bbox_left, bbox_bottom) != 0) ||
                        (tilemap_get_at_pixel(tilemap_hurt, bbox_right, bbox_bottom) != 0);
if (_is_on_hurt_tile) {
    image_blend = c_red;
    --hurt_frame;
    if (hurt_frame <= 0) {
        log_stat($"obj_player [Step] Hurt tick");
        hp -= 1;
        hurt_frame = hurt_cd_ticks;
    }
} else if (hurt_frame != 0) {
    hurt_frame = 0;
    image_blend = c_white;
}


if (_hor != 0 || _ver != 0)
{
    MOVING = true;
    if (_ver > 0 && _hor == 0) {
        sprite_index = spr_player_walk_down; 
        change_orientation(Orientation.DOWN);
    }
    else if (_ver > 0 && _hor < 0) {
        sprite_index = spr_player_walk_down; 
        change_orientation(Orientation.DOWNLEFT);
    }
    else if (_ver > 0 && _hor > 0) {
        sprite_index = spr_player_walk_down; 
        change_orientation(Orientation.DOWNRIGHT);
    }
    else if (_ver < 0 && _hor == 0) {
        sprite_index = spr_player_walk_up;
        change_orientation(Orientation.UP);
    }
    else if (_ver < 0 && _hor < 0) {
        sprite_index = spr_player_walk_up;
        change_orientation(Orientation.UPLEFT);
    }
    else if (_ver < 0 && _hor > 0) {
        sprite_index = spr_player_walk_up;
        change_orientation(Orientation.UPRIGHT);
    }
    else if (_hor > 0) {
        sprite_index = spr_player_walk_right;
        change_orientation(Orientation.RIGHT);
    }
    else if (_hor < 0) {
        sprite_index = spr_player_walk_left;
        change_orientation(Orientation.LEFT);
    }
}
else
{
    MOVING = false;
    if (sprite_index == spr_player_walk_down) {
        sprite_index = spr_player_idle_down;
        change_orientation(Orientation.DOWN);
    }
    else if (sprite_index == spr_player_walk_up) {
        sprite_index = spr_player_idle_up;
        change_orientation(Orientation.UP);
    }
    else if (sprite_index == spr_player_walk_right) {
        sprite_index = spr_player_idle_right;
        change_orientation(Orientation.RIGHT);
    }
    else if (sprite_index == spr_player_walk_left) {
        sprite_index = spr_player_idle_left;
        change_orientation(Orientation.LEFT);
    }
}

if (hp <= 0) {
    log_stat($"obj_player [Step] dead");
    game_restart();
}