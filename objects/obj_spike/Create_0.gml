

#macro State_UP 0
#macro State_DOWN 7

image_speed = 0;
state = is_on?State_UP:State_DOWN;
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
    state = is_on?State_UP:State_DOWN;
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
            up();
        } else {
            down();
        }
    }
}

function up() {
    state -= 1;
    image_index = state;
    if ( state == State_UP) {
        alarm[1] = 2 * TIME_SECOND;
    } else {
        alarm[2] = 0.02 * TIME_SECOND;
    }
}

function down() {
    state += 1;
    image_index = state;
    if ( state == State_DOWN ) {
        alarm[2] = 3 * TIME_SECOND;
    } else {
        alarm[1] = 0.25 * TIME_SECOND;
    }
}
