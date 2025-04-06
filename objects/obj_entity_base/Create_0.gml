default_move_speed = move_speed;
default_depth = depth;
MOVING = false;

collision_tilemaps = [layer_tilemap_get_id("Tiles_Col_Invis"), layer_tilemap_get_id("Tiles_Col")];
no_see_tilemaps = [layer_tilemap_get_id("No_light"), layer_tilemap_get_id("Tiles_Col")];

if (hp_total == 0) {
    hp_total = hp;
}

is_holding_item = false;
held_item = undefined;
function pickedUpItem(_item) {
    is_holding_item = true;
    held_item = _item;
}

function droppedItem(_item) {
    is_holding_item = false;
    held_item = undefined;
}

function onBattleDamageReceived(_damaged_amount) {
    
}

function clone_from(_other) {
    move_speed = _other.move_speed;
    default_move_speed = _other.default_move_speed;
    default_depth = _other.default_depth;
    level = _other.level;
    hp = _other.hp;
    hp_total = _other.hp_total;
    damage = _other.damage;
    defense = _other.defense;
    crit_chance = _other.crit_chance;
    charge_attack = _other.charge_attack;
    charge_attack_total = _other.charge_attack_total;
    charge_util = _other.charge_util;
    charge_util_total = _other.charge_util_total;
    lifesteal = _other.lifesteal;
}

function clone_to(_other) {
    _other.move_speed = move_speed;
    _other.default_move_speed = default_move_speed;
    _other.default_depth = default_depth;
    _other.level = level;
    _other.hp = hp;
    _other.hp_total = hp_total;
    _other.damage = damage;
    _other.defense = defense;
    _other.crit_chance = crit_chance;
    _other.charge_attack = charge_attack;
    _other.charge_attack_total = charge_attack_total;
    _other.charge_util = charge_util;
    _other.charge_util_total = charge_util_total;
    _other.lifesteal = lifesteal;
}


