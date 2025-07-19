

#macro State_IDLE 0
#macro State_EXTENDED 20

Alarm_Retract = 1;
Alarm_Extend = 2;
Alarm_Damage_CD = 3;

spear_tip_width = 6 * image_xscale;

image_speed = 0;
state = is_on?State_EXTENDED:State_IDLE;
doDamage = true;
doExtending = false;

afterPauseUp = true;


if (is_on) {
    image_index = state;
    alarm[Alarm_Retract] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
} else {
    image_index = state;
    alarm[Alarm_Extend] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
}


function reset() {
    state = is_on?State_EXTENDED:State_IDLE;
    alarm[Alarm_Retract] = 0;
    alarm[Alarm_Extend] = 0;
    if (is_on) {
        image_index = state;
        alarm[Alarm_Retract] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
    } else {
        image_index = state;
        alarm[Alarm_Extend] = start_delay_seconds * TIME_SECOND + TIME_SECOND;
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
    doExtending = true;
    state += 1;
    image_index = state;
    if ( state == State_EXTENDED) {
        alarm[Alarm_Retract] = 2 * TIME_SECOND;
    } else {
        alarm[Alarm_Extend] = 1;
    }
}

function retract() {
    doExtending = false;
    state -= 1;
    image_index = state;
    if ( state == State_IDLE ) {
        alarm[Alarm_Extend] = 3 * TIME_SECOND;
    } else {
        alarm[Alarm_Retract] = 0.1 * TIME_SECOND;
    }
}
