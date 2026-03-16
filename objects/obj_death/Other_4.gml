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
    var _death_name = getText("Death_name");
    
    create_dialog([
        new dialog_entry(_death_name, c_white, spr_lamp, new dialog_text(getText("Death_welcome")) ),
        new dialog_choice_entry(_death_name, c_white, spr_lamp, new dialog_text(string(getText("Death_score"), _score, global.highscore)), [
            new dialog_choice_text(string(getText("Death_playtime"), _playtime_seconds div 60, string_format(_playtime_seconds mod 60, 2, 0)), NOOP),
            new dialog_choice_text(string(getText("Death_xp"), stat.total_xp), NOOP),
            new dialog_choice_text(string(getText("Death_levelup"), stat.level_ups), NOOP),
            new dialog_choice_text(string(getText("Death_talents"), stat.talent_gains), NOOP),
            new dialog_choice_text(string(getText("Death_room"), stat.rooms_started), NOOP),
            new dialog_choice_text(string(getText("Death_secret"), stat.secrets_found, stat.secrets_all), NOOP),
            new dialog_choice_text(string(getText("Death_healing"), _total_healing), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_healing_cauldron"), stat.healing_cauldron, stat.healing_cauldron_count), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_healing_potions"), stat.healing_potion, stat.healing_potion_count), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_healing_levelup"), stat.healing_levelup, stat.healing_levelup_count), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_healing_lifesteal"), stat.healing_lifesteal, stat.healing_lifesteal_count), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_healing_other"), stat.healing_other, stat.healing_other_count), NOOP),
            new dialog_choice_text(string(getText("Death_damage"), _total_damage_dealt), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_damage_enemy"), stat.damage_to_enemies, stat.damage_to_enemies_count), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_damage_crit"), stat.crits, (stat.damage_to_enemies_count==0)?(0):round(stat.crits / stat.damage_to_enemies_count *100)), NOOP),
            new dialog_choice_text(string(getText("Death_dmgtaken"), _total_damage_taken), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_dmgtaken_enemy"),
                        stat.damage_by_enemies,
                        stat.damage_by_enemies_count,
                        stat.enemy_crits,
                        (stat.damage_by_enemies_count==0)?(0):round(stat.enemy_crits / stat.damage_by_enemies_count *100)
                        ), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_dmgtaken_spike"), stat.damage_by_spiketrap, stat.damage_by_spiketrap_count), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_dmgtaken_poisontrap"), stat.damage_by_poisontrap, stat.damage_by_poisontrap_count), NOOP), 
                new dialog_choice_text(string("  |-" + getText("Death_dmgtaken_speartrap"), stat.damage_by_speartrap, stat.damage_by_speartrap_count), NOOP), 
                new dialog_choice_text(string("  |-" + getText("Death_dmgtaken_balltrap"), stat.damage_by_balltrap, stat.damage_by_balltrap_count), NOOP), 
                new dialog_choice_text(string("  |-" + getText("Death_dmgtaken_tnt"), stat.damage_by_tnt, stat.damage_by_tnt_count), NOOP),
            new dialog_choice_text(string(getText("Death_distance"), _total_distance), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_distance_walk"), stat.distance_walked, (_total_distance==0)?(0):round(stat.distance_walked / _total_distance *100)), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_distance_run"), stat.distance_ran, (_total_distance==0)?(0):round(stat.distance_ran / _total_distance *100)), NOOP),
            new dialog_choice_text(getText("Death_corruption"), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_corruption_gain"), stat.corruption_gained), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_corruption_lost"), stat.corruption_lost), NOOP),
            new dialog_choice_text(string(getText("Death_fish"), stat.fish_caught + stat.fish_missed), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_fish_caught"), stat.fish_caught), NOOP),
                new dialog_choice_text(string("  |-" + getText("Death_fish_gotaway"), stat.fish_missed), NOOP)

       ])
    ], true);
}