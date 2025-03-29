if (!is_on) {
    exit;
}

if (state >= State_DOWN-1 /*|| state == State_DOWN*/) {
    exit;
}

if (doDamage) {
    //if (do_damage_entity)
    
    if (only_player && other.object_index != obj_player) exit;
    
    doDamage = false;
    other.hp -= damage;
    
    spawn_effect(spr_blood_spill, other.x, other.y, 0.7*other.sprite_width, 0.7*other.sprite_width, other.depth-1, 0, 0, 1);
    //sprite_add_ext()
    alarm[3] = 0.2 * TIME_SECOND;
}
