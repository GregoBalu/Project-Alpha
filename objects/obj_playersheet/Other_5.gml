if (openingSoundId != undefined && audio_is_playing(openingSoundId)) {
    audio_stop_sound(openingSoundId);
    openingSoundId = undefined;
}

if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    _inst.sheet = {
        talents: ds_list_create()
    };
    ds_list_copy(_inst.sheet.talents, self.talents);
}