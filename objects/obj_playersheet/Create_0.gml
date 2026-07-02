
enum State { Closed, Opening, Open, Closing };
state = State.Closed;
global.do_draw_adventure_gui = true;
min_open_state = 30;
step_open = 8;
opening_state = min_open_state;
max_open_state = 316;

depth = 0;

title = getText("Player_sheet_title");
hp_label = getText("Health_label");
atkchrg_label = getText("Attack_charge_label");
utlchrg_label = getText("Utility_charge_label");
level_label = getText("Level_label");
xp_label = getText("XP_label");
dmg_label = getText("Damage_label");
spd_label = getText("Speed_label");
def_label = getText("Defense_label");
crit_label = getText("Crit_label");
lifesteal_label = getText("Lifesteal_label");

avail_talent_label = getText("Available_talent_label");

coins_hint = getText("Coins_hint");
symbols_hint = getText("Symbols_hint");
keyring_hint = getText("Keyring_hint");

_draggingItem = false;
_dragSlotFromInventory = undefined;
_dragSlotFromEquipment = undefined;

openingSoundId = undefined;

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)