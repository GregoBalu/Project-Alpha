event_inherited();

init_localisation();

options = ["English", "Magyar"];
init = function() {
    show_debug_message($"lang_dropdown.init() lang={global.language}");
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