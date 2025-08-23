/// @description shoot cycle

alarm[ProjectileSpitterAlarms.ShootCycle] = cycleTimeSeconds*TIME_SECOND;

if (paused) exit;
    
shoot();
