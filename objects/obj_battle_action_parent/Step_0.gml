
if (obj_battle_manager.enemy_turn || !checkCost(cost_type, cost_amount)) {
    image_alpha = .2;
} else {
    image_alpha = 1;
}

if (hotkey != undefined && keyboard_check_pressed(hotkey)) {
    if (obj_battle_manager.enemy_turn || !obj_battle_manager.battle_started) exit;

    action();
}