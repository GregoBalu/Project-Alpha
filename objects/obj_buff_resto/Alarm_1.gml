var _hp_begin = targetObject.hp;
targetObject.hp = clamp(targetObject.hp+hot_damage, 0, targetObject.hp_total);
var _actual_healing = targetObject.hp - _hp_begin;
if (do_statistic) {
    targetObject.statistic.healing_potion += _actual_healing;
    targetObject.statistic.healing_potion_count += (1/hot_ticks);
}

alarm[1] = hot_tickrate_seconds*TIME_SECOND;