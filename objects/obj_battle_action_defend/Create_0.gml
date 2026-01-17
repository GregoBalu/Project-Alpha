event_inherited();

hotkey = global.input_battle_ultimate;

defense_increase = 2;
buff_turns = 1;


for (var _i = 0; _i < ds_list_size(obj_battle_switcher.player_data.unlocked_talents); _i++)
{
    var _talent = obj_battle_switcher.player_data.unlocked_talents[|_i];
    if (_talent.object_index == obj_talent_defend_lengthen) {
        buff_turns += _talent.bonus_turns;
        cost_amount += _talent.increase_cost;
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
            sprite: spr_buff_defend,
            hint: global.hint_buff_defend
        },
        function(_data){
            //start
            obj_battle_player.data.defense += _data.bonus_defense;
        }, function(_data) {
            //end
            obj_battle_player.data.defense -= _data.bonus_defense;
        }));
    
    var animTime = BattlePlayerWaitAnimationTime;
    obj_battle_manager.player_turn(undefined, animTime);
}


hint = $"Ultimate [{key2str(hotkey)}]\nHarden yourself for incoming attacks.\nGives a buff for {buff_turns} turns, that increase Defense by {defense_increase}";