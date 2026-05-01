// Inherit the parent event
event_inherited();

image_speed = 0;

image_index = 0;
max_image_index = 8;

tick = 0;

getBuffData = function(_othr) {
    return {
        obj : obj_buff_poison,
        data : {
            targetObject : _othr,
            duration_seconds : poison_duration_seconds,
            dot_damage : dot_damage,
            dot_tickrate_seconds : dot_tickrate_seconds
        }
    };
}

hitboxes_len = image_number;
hitboxes = array_create(hitboxes_len, undefined);
hitboxes[2] = new Hitbox(self, 8, 10, 26, 19);
hitboxes[3] = new Hitbox(self, 8, 7, 43, 22);
hitboxes[4] = new Hitbox(self, 8, 7, 43, 22);
hitboxes[5] = new Hitbox(self, 21, 7, 43, 21);
hitboxes[6] = new Hitbox(self, 32, 11, 39, 19);



