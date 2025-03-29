targetObject.hp = clamp(targetObject.hp+hot_damage, 0, targetObject.hp_total);

alarm[1] = hot_tickrate_seconds*TIME_SECOND;