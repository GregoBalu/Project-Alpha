if (instance_exists(obj_dialog) || instance_exists(obj_vendor)) exit;
    
    
if (array_length(stock) != 0 && instance_exists(obj_player) && distance_to_object(obj_player) < talk_distance) {
    if (!can_talk) {
        can_talk = true;
        talk_index = 0;
        obj_gui.show_talk++;
        if (!is_silent) {
            audio_play_sound_at(snd_huh, x, y, 0, 1, 16, 0.3, false, 5);
        }
    }
    
    if (keyboard_check_pressed(input_key)) {
        var _inst = instance_create_depth(0, 0, 0, obj_vendor, {
            stock: self.stock
        });
    }
} else {
    if (can_talk) {
        can_talk = false;
        obj_gui.show_talk--;
    }
}

if (can_talk) {
    talk_index += 0.125;
    talk_index = talk_index mod 5;
}

if (do_wander) {

    npc_move_towards_point(target_x, target_y);

}