function buff_create_frenzy(_turns)
{
    init_localisation();
    return new BattleBuff(_turns, 
        { 
            prev_damage: 0,
            sprite: spr_buff_frenzy,
            hint: getText("Buff_frenzy_hint")
        },
        function(_data){
            //start
            
        }, function(_data) {
            //end 
            
        }, function(_data) {
            //player pre
            
        }, function(_data) {
            //player post
            
        }, function(_data){
            //enemy pre
            
            //var _attack_ratio = obj_battle_enemy.data.charge_attack / obj_battle_enemy.data.charge_attack_total;
            //var _util_ratio = obj_battle_enemy.data.charge_util / obj_battle_enemy.data.charge_util_total;
            
            _data.prev_damage = obj_battle_enemy.data.damage;
            
            obj_battle_enemy.data.damage = _data.prev_damage + _data.prev_damage * obj_battle_enemy.data.charge_attack - _data.prev_damage * obj_battle_enemy.data.charge_util;
            
        }, function(_data){
            //enemy post
            obj_battle_enemy.data.damage = _data.prev_damage;
        });
}