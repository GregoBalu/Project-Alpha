if (!is_on || paused) {
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
    obj_player.statistic.damage_by_spiketrap += damage;
    obj_player.statistic.damage_by_spiketrap_count++;
    
    //TODO: sound effect
    spawn_effect(spr_blood_spill, other.x, other.y, 0.7*other.sprite_width, 0.7*other.sprite_width, other.depth-1, 0, 0, 1);
    
    alarm[3] = 0.2 * TIME_SECOND;
}
