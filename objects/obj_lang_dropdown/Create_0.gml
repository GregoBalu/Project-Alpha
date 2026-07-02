event_inherited();

options = ["English", "Magyar"];
init = function() {
    if (global.language == "en") {
        selected_index = 0;
    } else if (global.language == "hu") {
        selected_index = 1;
    }
}

onChanged = function() {
    if (selected_index == 0) {
        loadLocale("en");
    } else if (selected_index == 1) {
        loadLocale("hu");
    }
    instance_create_layer(0, 0, "Instances", obj_menu_view_switcher, {
        from_view: 1
    })
    room_restart();
}

init();