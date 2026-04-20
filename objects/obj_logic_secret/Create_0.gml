
visible = false;

obj_player.statistic.secrets_all++;

recheck_time = 0.3*TIME_SECOND;
alarm[0] = recheck_time + random_range(0, 0.5*TIME_SECOND);