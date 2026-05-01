event_inherited();

#macro State_IDLE 0
#macro State_EXTENDED 20

Alarm_Retract = 1;
Alarm_Extend = 2;
Alarm_Damage_CD = 3;



image_speed = 0;
state = is_on?State_EXTENDED:State_IDLE;
doDamage = true;
doExtending = false;

afterPauseUp = true;

hitboxes_len = image_number;
hitboxes = array_create(hitboxes_len, undefined);

hitboxes[1] = new Hitbox(self, 0, 3, 0, 13);
hitboxes[2] = new Hitbox(self, 0, 2, 1, 14);
hitboxes[3] = new Hitbox(self, 0, 1, 2, 15);
hitboxes[4] = new Hitbox(self, 0, 1, 3, 15);
hitboxes[5] = new Hitbox(self, 0, 1, 4, 15);
hitboxes[6] = new Hitbox(self, 1, 1, 5, 15);
hitboxes[7] = new Hitbox(self, 2, 1, 6, 15);
hitboxes[8] = new Hitbox(self, 3, 1, 7, 15);
hitboxes[9] = new Hitbox(self, 4, 1, 8, 15);
hitboxes[10] = new Hitbox(self, 5, 1, 9, 15);
hitboxes[11] = new Hitbox(self, 6, 1, 10, 15);
hitboxes[12] = new Hitbox(self, 7, 1, 11, 15);
hitboxes[13] = new Hitbox(self, 8, 1, 12, 15);
hitboxes[14] = new Hitbox(self, 9, 1, 13, 15);
hitboxes[15] = new Hitbox(self, 10, 1, 14, 15);
hitboxes[16] = new Hitbox(self, 11, 1, 15, 15);
hitboxes[17] = new Hitbox(self, 12, 1, 16, 15);
hitboxes[18] = new Hitbox(self, 13, 1, 17, 15);
hitboxes[19] = new Hitbox(self, 14, 1, 18, 15);
hitboxes[20] = new Hitbox(self, 15, 1, 19, 15);

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
        doExtending = false;
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

onPlayerCollide = function() {
	if (!doExtending) {
		exit;
	}
	
	if (doDamage) {
		doDamage = false;
		obj_player.hp -= damage;
		obj_player.statistic.damage_by_speartrap += damage;
		obj_player.statistic.damage_by_speartrap_count++;
		
		spawn_blood_on(obj_player);
		//sprite_add_ext()
		alarm[Alarm_Damage_CD] = 0.2 * TIME_SECOND;
	}
}
