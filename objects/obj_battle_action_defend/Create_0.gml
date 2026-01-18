event_inherited();

hotkey = global.input_battle_ultimate;

defense_increase = 2;
buff_turns = 1;

heal_blocked_percent = 0;

for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_defend_lengthen) {
        buff_turns += _talent.bonus_turns;
        cost_amount += _talent.increase_cost;
    } else if (_talent.object_index == obj_talent_defend_heal) {
        defense_increase -= _talent.decrease_defense;
        heal_blocked_percent = _talent.blocked_heal_percent;
    }
}

action = function() {
    if (!checkCost(cost_type, cost_amount)) {
        return;
    }
    
    obj_battle_player.data.charge_util -= cost_amount;
    
    obj_battle_player.ultimate_used++;
    
    obj_battle_player.add_buff(new BattleBuff(buff_turns*2, 
        {
            bonus_defense: defense_increase,
            heal_blocked: heal_blocked_percent,
            blocked_damage: obj_battle_player.blocked_damage,
            sprite: spr_buff_defend,
            hint: global.hint_buff_defend
        },
        function(_data){
            //start
            obj_battle_player.data.defense += _data.bonus_defense;
        }, function(_data) {
            //end
            obj_battle_player.data.defense -= _data.bonus_defense;
            if (_data.heal_blocked > 0) {
                var _blocked = obj_battle_player.blocked_damage - _data.blocked_damage;
                obj_battle_player.take_damage(-_blocked*_data.heal_blocked, false);
            }
        }));
    
    var animTime = BattlePlayerWaitAnimationTime;
    obj_battle_manager.player_turn(undefined, animTime);
}


hint = $"Ultimate [{key2str(hotkey)}]\nHarden yourself for incoming attacks.\nGives a buff for {buff_turns} turns, that increase Defense by {defense_increase}.";
if (heal_blocked_percent > 0) {
    hint += $"\nHeal for {heal_blocked_percent*100}% of blocked damage.";
}