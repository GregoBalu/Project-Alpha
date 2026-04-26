function initDialogCave(){
    initDialog();
    init_localisation();
}
initDialogCave();

global.dialog_cave_guard = [
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_cave_g_l1")) ),
    new dialog_entry(global.dialog_player_name, global.dialog_player_color, spr_player_idle_down, new dialog_text(getText("Dialog_cave_g_l2")) ),
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_cave_g_l3")) ),
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_cave_g_l4")) )
];

global.dialog_cave_guard_alt = [
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_cave_g_a1")) ),
    new dialog_entry(global.guard_friend_name, global.guard_friend_color, spr_npc_guard, new dialog_text(getText("Dialog_cave_g_a2")) )
];