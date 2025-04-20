event_inherited();

good_percent = 0.6;
damage_modifier = 1.8;

name = "Hit by chance"
hint = $"{good_percent*100}% chance: damage x{damage_modifier}\n{(1-good_percent)*100}% chance: damage x{1/damage_modifier}";
