// Inherit the parent event
event_inherited();

prev_frame_collision = false;
cd_to_teleport = 0;
teleport_at_frames = 2.0*TIME_SECOND;
effect_index = 0;
effect_ramp_down = 0;

if (target_x == -1 && target_y == -1) {
    is_on = false;
}
