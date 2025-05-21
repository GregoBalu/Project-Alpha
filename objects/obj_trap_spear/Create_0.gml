

#macro State_IDLE 0
#macro State_EXTENDED 20

image_speed = 0;
state = is_on?State_EXTENDED:State_IDLE;
doDamage = true;

afterPauseUp = true;


if (is_on) {
    image_index = state;
    alarm[1] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
} else {
    image_index = state;
    alarm[2] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
}


function reset() {
    state = is_on?State_EXTENDED:State_IDLE;
    alarm[1] = 0;
    alarm[2] = 0;
    if (is_on) {
        image_index = state;
        alarm[1] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
    } else {
        image_index = state;
        alarm[2] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
    }
}

function pause() {
    paused = !paused;
    if (!paused) {
        if (afterPauseUp) {
            extend();
        } else {
            retract();
        }
    }
}

function extend() {
    state += 1;
    image_index = state;
    if ( state == State_EXTENDED) {
        alarm[1] = 2 * TIME_SECOND;
    } else {
        alarm[2] = 1;
    }
}

function retract() {
    state -= 1;
    image_index = state;
    if ( state == State_IDLE ) {
        alarm[2] = 3 * TIME_SECOND;
    } else {
        alarm[1] = 0.1 * TIME_SECOND;
    }
}
