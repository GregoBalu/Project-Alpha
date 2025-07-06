if (room == rm_stat) {
    
    var _ct = date_current_datetime();
    var _playtime_seconds = date_second_span(stat.start_time, _ct);
    
    var _total_healing = stat.healing_cauldron + stat.healing_potion + stat.healing_lifesteal + stat.healing_levelup + stat.healing_other;
    var _total_damage_taken = stat.damage_by_spiketrap + stat.damage_by_poisontrap + stat.damage_by_speartrap + stat.damage_by_balltrap + stat.damage_by_tnt + stat.damage_by_enemies;
    var _total_damage_dealt = stat.damage_to_enemies;
    
    var _total_distance = stat.distance_ran + stat.distance_walked;
    
    var _score = (stat.total_xp / 10) + (stat.talent_gains) + (_total_damage_dealt / 100) - (_total_damage_taken / 500) - (_total_healing / 100);
    var _previous_highscore = global.highscore;
    if (global.highscore < _score) {
        global.highscore = _score;
    }
    log_highscore(_score);
    
    create_dialog([
        new dialog_entry("Death", c_white, spr_lamp, new dialog_text("You have died. Let's see what you have achieved in your short life:") ),
        new dialog_choice_entry("Death", c_white, spr_lamp, new dialog_text($"Score: {_score}  (Highscore: {global.highscore})"), [
            new dialog_choice_text($"Total time played: {_playtime_seconds div 60}m {string_format(_playtime_seconds mod 60, 2, 0)}s", NOOP),
            new dialog_choice_text($"Total XP earned: {stat.total_xp}", NOOP),
            new dialog_choice_text($"Total level ups: {stat.level_ups}", NOOP),
            new dialog_choice_text($"Total talent points gained: {stat.talent_gains}"),
            new dialog_choice_text($"Total healing: {_total_healing}", NOOP),
                new dialog_choice_text($"  |-Healing from cauldrons: {stat.healing_cauldron}, {stat.healing_cauldron_count} times", NOOP),
                new dialog_choice_text($"  |-Healing from potions: {stat.healing_potion}, {stat.healing_potion_count} times", NOOP),
                new dialog_choice_text($"  |-Healing from leveling up: {stat.healing_levelup}, {stat.healing_levelup_count} times", NOOP),
                new dialog_choice_text($"  |-Healing from lifesteal: {stat.healing_lifesteal}, {stat.healing_lifesteal_count} times", NOOP),
                new dialog_choice_text($"  |-Healing from other: {stat.healing_other}, {stat.healing_other_count} times", NOOP),
            new dialog_choice_text($"Total damage dealt: {_total_damage_dealt}", NOOP),
                new dialog_choice_text($"  |-Damage dealt to enemies: {stat.damage_to_enemies}, {stat.damage_to_enemies_count} times", NOOP),
                new dialog_choice_text($"  |-Critical hits: {stat.crits}, {(stat.damage_to_enemies_count==0)?(0):(stat.crits / stat.damage_to_enemies_count *100)}%", NOOP),
            new dialog_choice_text($"Total damage taken: {_total_damage_taken}", NOOP),
                new dialog_choice_text($"  |-Damage dealt by enemies: {stat.damage_by_enemies}, {stat.damage_by_enemies_count} times, crits: {stat.enemy_crits}, {(stat.damage_by_enemies_count==0)?(0):(stat.enemy_crits / stat.damage_by_enemies_count *100)}%", NOOP),
                new dialog_choice_text($"  |-Damage dealt by spikes: {stat.damage_by_spiketrap}, {stat.damage_by_spiketrap_count} times", NOOP),
                new dialog_choice_text($"  |-Damage dealt by poison: {stat.damage_by_poisontrap}, {stat.damage_by_poisontrap_count} times", NOOP),
                new dialog_choice_text($"  |-Damage dealt by spear: {stat.damage_by_speartrap}, {stat.damage_by_speartrap_count} times", NOOP),
                new dialog_choice_text($"  |-Damage dealt by rolling ball: {stat.damage_by_balltrap}, {stat.damage_by_balltrap_count} times", NOOP),
                new dialog_choice_text($"  |-Damage dealt by tnt: {stat.damage_by_tnt}, {stat.damage_by_tnt_count} times", NOOP),
            new dialog_choice_text($"Total distance travelled: {_total_distance} units", NOOP),
                new dialog_choice_text($"  |-Distance walked: {stat.distance_walked} units, {(_total_distance==0)?(0):(stat.distance_walked / _total_distance *100)}%", NOOP),
                new dialog_choice_text($"  |-Distance ran: {stat.distance_ran} units, {(_total_distance==0)?(0):(stat.distance_ran / _total_distance *100)}%", NOOP),
            new dialog_choice_text($"Corruption", NOOP),
                new dialog_choice_text($"  |-Total corruption gained: {stat.corruption_gained}", NOOP),
                new dialog_choice_text($"  |-Total corruption lost: {stat.corruption_lost}", NOOP),
            new dialog_choice_text($"Total fish lured: {stat.fish_caught+stat.fish_missed}", NOOP),
                new dialog_choice_text($"  |-Total fish caught: {stat.fish_caught}", NOOP),
                new dialog_choice_text($"  |-Total fish got away: {stat.fish_missed}", NOOP)
       ])
    ], true);
}