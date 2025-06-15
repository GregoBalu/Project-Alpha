event_inherited();

function effect() {
    obj_player.hp_total += bonus_hp;
    obj_player.hp += bonus_hp;
    obj_player.damage -= minus_damage;
}

bonus_hp = 5;
minus_damage = 0.5;

name = "Healthy but weak";
hint = string("health: +{0}\ndamage: -{1}", bonus_hp, minus_damage);