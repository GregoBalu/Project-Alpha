function initDialogRoom1(){
    initDialog();
    init_localisation();
}
init_localisation();

global.dialog_welcome = [
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_r1_w1_l1")), 
        function() {
            audio_play_sound(snd_huh, AUDIO_PRIO_UNIQUE, false, 1.2);
        } ),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, new dialog_text(getText("Dialog_r1_w1_l2")) ),
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_r1_w1_l3")) ),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, new dialog_text(getText("Dialog_r1_w1_l4")) ),
    new dialog_entry("", c_white, undefined, new dialog_text(getText("Dialog_r1_w1_l5"), font_base_italic, c_ltgray), 
        function() {
            screenshake(0, 3*TIME_SECOND, 2, 0.25);
        }, function() {
            screenshake_stop();
        }),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, new dialog_text(getText("Dialog_r1_w1_l6")) )
];
global.dialog_welcome_alt = [
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_r1_w2_l1")) )
];

global.dialog_hint_talent_star = [
    new dialog_entry(getText("Dialog_r1_hint_star_name"), c_white, undefined, new dialog_text(getText("Dialog_r1_hint_star")) )
]

global.dialog_hint_yellow_key = [
    new dialog_entry(getText("Dialog_r1_hint_key_name"), c_yellow, spr_key, new dialog_text(getText("Dialog_r1_hint_key")), undefined, undefined, c_yellow ),
 ]

global.dialog_hint_cauldron = [
    new dialog_entry(getText("Dialog_r1_hint_cauldron_name"), c_white, spr_cauldron, new dialog_text(getText("Dialog_r1_hint_cauldron1")) ),
    new dialog_entry(getText("Dialog_r1_hint_cauldron_name"), c_white, spr_cauldron, new dialog_text(getText("Dialog_r1_hint_cauldron2")) ),
    new dialog_entry(getText("Dialog_r1_hint_cauldron_name"), c_white, spr_cauldron, new dialog_text(getText("Dialog_r1_hint_cauldron3")) )
]

global.dialog_hint_healing_potion = [
    new dialog_entry(getText("Dialog_r1_hint_healing_potion_name"), c_white, spr_heal_bottle, new dialog_text(getText("Dialog_r1_hint_healing_potion")) )
]

global.dialog_hint_playersheet = [
    new dialog_entry(getText("Dialog_r1_hint_playersheet_name"), c_white, undefined, new dialog_text(string(getText("Dialog_r1_hint_playersheet"), key2str(global.input_playersheet))) )
]

global.dialog_hint_room1_leverpuzzle = [
    new dialog_entry(getText("Dialog_r1_note_name"), c_white, spr_note, new dialog_text(getText("Dialog_r1_lever1")) ),
    new dialog_entry(getText("Dialog_r1_note_name"), c_green, spr_note, new dialog_text(getText("Dialog_r1_lever2")) )
];

global.dialog_lore_room1_hiddensecret1 = [
    new dialog_entry(getText("Dialog_r1_note_name"), c_white, spr_note, new dialog_text(getText("Dialog_r1_hidden_note")))
];
