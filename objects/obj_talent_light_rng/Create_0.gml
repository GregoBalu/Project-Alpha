event_inherited();

good_percent = 0.6;
damage_modifier = 1.8;

name = getText("Talent_light_rng_name");
hint = string(getText("Talent_light_rng_hint"), good_percent*100, damage_modifier, (1-good_percent)*100, 1/damage_modifier);
