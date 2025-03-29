x = 8;
y = 8;

needBuffBarRemove = false;

visible = false;
if (targetObject.id == obj_player.id) {
    //add to buf bar
    visible = true;
    if (!targetObject.buff_bar.addBuff(self)) {
        instance_destroy();
        return;
    } else {
        needBuffBarRemove = true;
    }
}

blink_duration = 2;
blink_interval = .4;

setDuration(duration_seconds);

function setDuration(_num) {
    duration_seconds = _num;
    
    alarm[10] = -1;
    if (duration_seconds <= blink_duration) {
        
        if (duration_seconds < blink_interval) {
            blink_duration = 0;
            alarm[9] = duration_seconds*TIME_SECOND;
        } else {
            blink_duration = duration_seconds-blink_interval;
            alarm[9] = blink_interval*TIME_SECOND;
        }
    } else {
        alarm[9] = (duration_seconds-blink_duration) * TIME_SECOND;
    }
}

function addStack(_num) {
    stack += _num;
}

