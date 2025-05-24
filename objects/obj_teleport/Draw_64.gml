if (prev_frame_collision && cd_to_teleport > 0 && cd_to_teleport < teleport_at_frames) {
    var _progress = cd_to_teleport / teleport_at_frames;
    draw_sprite_stretched_ext(spr_effect_swirl, effect_index div 6, 0, 0, display_get_gui_width(), display_get_gui_height(), c_aqua, 0.4*_progress);
}