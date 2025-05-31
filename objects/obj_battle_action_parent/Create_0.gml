action = function() {
    
}

function canUse() {
    return obj_battle_manager.battle_started && !obj_battle_manager.enemy_turn && checkCost(cost_type, cost_amount);
}

hint = "";
hotkey = vk_enter;