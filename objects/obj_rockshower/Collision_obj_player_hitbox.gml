if (!is_on) exit;
if (damage_cooldown > 0) exit;
if (image_index < 6 || image_index>=15) exit;
    
obj_player.damage_receive(2);
obj_player.statistic.damage_by_rockshower += 2;
obj_player.statistic.damage_by_rockshower_count++;

damage_cooldown = TIME_SECOND;
alarm[0] = damage_cooldown;
