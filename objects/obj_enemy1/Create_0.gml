// Inherit the parent event
event_inherited();

function doEnemyAction(_selfData, _playerData) {
    var _select = random_range(0, 10);
        
    if (_selfData.charge_attack >= 1) _select++;
    if (_selfData.charge_attack >= 2) _select++;
    if (_selfData.charge_util >= 1) _select++;
    if (_selfData.charge_util >= 2) _select++;
    
    if (_select < 5) {
        return enemySimpleAttack(obj_battle_enemy);
    } else if (_selfData.charge_util >= 1) {
        if (_select < 7) {
            return enemyInterruptAttack(obj_battle_enemy);
        } else {
            return enemyCastFireball(1.2, obj_battle_enemy);
        }
    } else if (_selfData.charge_attack >= 1) {
            return enemyHeavyAttack(obj_battle_enemy);
    } else {
        return enemyWait(obj_battle_enemy);
    }
}