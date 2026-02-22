event_inherited();

function effect() {
    obj_player.hp_total += bonus_hp;
    obj_player.hp += bonus_hp;
    obj_player.damage -= minus_damage;
}

bonus_hp = 5;
minus_damage = 0.5;

name = getText("Talent_hp_dmg_name");
hint = string(getText("Talent_hp_dmg_hint"), bonus_hp, minus_damage);