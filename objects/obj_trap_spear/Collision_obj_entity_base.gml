if (!is_on) {
    exit;
}

if (!doExtending) {
    exit;
}

if (doDamage) {
    //if (do_damage_entity)
    
    if (only_player && other.object_index != obj_player) exit;
    
    doDamage = false;
    other.hp -= damage;
    if (other.object_index == obj_player) {
        obj_player.statistic.damage_by_speartrap += damage;
        obj_player.statistic.damage_by_speartrap_count++;
    }
    
    spawn_effect(spr_blood_spill, other.x, other.y, 0.7*other.sprite_width, 0.7*other.sprite_width, other.depth-1, 0, 0, 1);
    //sprite_add_ext()
    alarm[3] = 0.2 * TIME_SECOND;
}
