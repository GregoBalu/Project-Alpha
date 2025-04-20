// Inherit the parent event
event_inherited();

charge_turns_max = 3;

function initBattle() {
    obj_battle_enemy.charge_started = false;
    obj_battle_enemy.charge_turns = charge_turns_max;
    obj_battle_enemy.turns_without_charge = 0;
}

function doEnemyAction(_selfData, _playerData) {
    
    if (obj_battle_manager.turn < 2) {
        var _select = random_range(0, 2);
        if (_select < 1.0) {
            return enemySimpleAttack(obj_battle_enemy);
        } else if (_selfData.charge_attack >= 1) {
            return enemyHeavyAttack(obj_battle_enemy);
        } else if (_selfData.charge_util >= 1) {
            return enemyCastFireball(2, obj_battle_enemy, 1.2, 2);
        } else {
            return enemyWait(obj_battle_enemy);
        }
    } else {
        if (!obj_battle_enemy.charge_started) {
            var _select = random_range(0, 1);
            if (_select < (0.75 - 0.1*obj_battle_enemy.turns_without_charge) ) {
                ++obj_battle_enemy.turns_without_charge;
                if (_selfData.charge_attack >= 1) {
                    return enemyHeavyAttack(obj_battle_enemy);
                } else if (_selfData.charge_util >= 1) {
                    return enemyCastFireball(2, obj_battle_enemy, 1.3, 2);
                } else {
                    return enemySimpleAttack(obj_battle_enemy);
                }
            } else {
                obj_battle_enemy.charge_started = true;
                return 0;
            }
        } else {
            --obj_battle_enemy.charge_turns;
            if (obj_battle_enemy.charge_turns <= 0) {
                obj_battle_enemy.charge_started = false;
                obj_battle_enemy.charge_turns = charge_turns_max;
                obj_battle_enemy.turns_without_charge = 0;
                return enemyCastInferno(obj_battle_enemy);
            } else {
                return 0;
            }
        }
    }
}

function battleDraw(_obj) {
    if (obj_battle_enemy.charge_started) {
        
        var _x = _obj.x + 40;
        var _y = _obj.y - 30;
        var _r = 8;
        
        draw_circle_color(_x, _y, _r, c_gray, c_gray, false);
        draw_circle_color(_x, _y, 1, c_black, c_black, false);
        
        var _defColor = draw_get_color();
        if (obj_battle_enemy.charge_turns <= 3) {
            draw_set_color(c_yellow);
            draw_pie(_x-_r+1, _y-_r+1, _x+_r+1, _y+_r+1, _x+_r+1, _y+lengthdir_y(_r,330)+1, _x+1, _y-_r+1, false);
        }
        if (obj_battle_enemy.charge_turns <= 2) {
            draw_set_color(c_orange);
            draw_pie(_x-_r+1, _y-_r+1, _x+_r+1, _y+_r+1, _x+lengthdir_x(_r,210)+1, _y+lengthdir_y(_r,210)+1, _x+_r+1, _y+lengthdir_y(_r,330)+1, false);
        }
        if (obj_battle_enemy.charge_turns <= 1) {
            draw_set_color(c_red);
            draw_pie(_x-_r+1, _y-_r+1, _x+_r+1, _y+_r+1, _x+1, _y-_r+1, _x+lengthdir_x(_r,210)+1, _y+lengthdir_y(_r,210)+1, false);
        }

        //draw_textbox(x+2.5,y+2.5, 8, 8, string_format(cost_amount, 1, 1), fa_center, fa_middle);
        draw_set_color(_defColor);
        
        draw_circle_color(_x, _y, _r, c_black, c_black, true);
    }
}
