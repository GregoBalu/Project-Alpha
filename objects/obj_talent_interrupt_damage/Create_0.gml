event_inherited();

effect_turns = 6;
min_dmg = 8;
additional_dmg = 4;
additional_armor = 2;

effect = function() {
    //Nothing
}

name = getText("Talent_interrupt_damage_name");
hint = string(getText("Talent_interrupt_damage_hint"), effect_turns/2, min_dmg, additional_dmg, additional_armor);
