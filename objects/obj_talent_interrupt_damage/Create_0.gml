event_inherited();

effect_turns = 6;
min_dmg = 8;
additional_dmg = 4;
additional_armor = 2;

function effect() {
    //Nothing
}

name = "Delayed penetration"
hint = $"Modifies action: Interrupt\nCreate a buff on target for {effect_turns/2} turns.\nIf target receives at least {min_dmg} damage it takes an additional {additional_dmg} damage.\nOtherwise the target gains {additional_armor} defense";
