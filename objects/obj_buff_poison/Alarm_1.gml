targetObject.hp -= (dot_damage*stack);
if (targetObject.object_index == obj_player) {
    targetObject.statistic.damage_by_poisontrap += (dot_damage*stack);
    targetObject.statistic.damage_by_poisontrap_count += (1/dot_ticks);
}

alarm[1] = dot_tickrate_seconds*TIME_SECOND;