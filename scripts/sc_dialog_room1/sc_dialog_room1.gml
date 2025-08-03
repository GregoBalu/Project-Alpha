function initDialogRoom1(){
    initDialog();
}

global.dialog_welcome = [
    new dialog_entry("Geoff", c_aqua, spr_npc1, new dialog_text("Hey, I started to worry you wouldn't show up at all. What took you so long?")),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, new dialog_text("Sorry, I got held up by the guards at the city exit. So where is this Witch you were talking about?") ),
    new dialog_entry("Geoff", c_aqua, spr_npc1, new dialog_text("She ... It went deep inside this dungeon of sort but it may know our plan. It started to prepare. Be on your guard!") ),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, new dialog_text("Will do. Any sign of corruption yet? ...") ),
    new dialog_entry("", c_white, undefined, new dialog_text("<A loud bang shakes the ground>", font_base_italic, c_ltgray), 
        function() {
            screenshake(0, 3*TIME_SECOND, 2, 0.25);
        }, function() {
            screenshake_stop();
        }),
    new dialog_entry(dialog_player_name, dialog_player_color, spr_player_idle_down, new dialog_text("Nevermind, I'll get started!") )
];
global.dialog_welcome_alt = [
    new dialog_entry("Geoff", c_aqua, spr_npc1, new dialog_text("Get in there and slay that Witch!") )
];

global.dialog_hint_talent_star = [
    new dialog_entry("Talent Star", c_white, undefined, new dialog_text($"This is a talent star. You can pick it up to to gain a talent point and be able to choose a talent just like when you would level up.") )
]

global.dialog_hint_yellow_key = [
    new dialog_entry("Yellow key", c_yellow, spr_key, new dialog_text("This is a yellow key. It opens the yellow door. Now where might that door be ...") ),
 ]

global.dialog_hint_cauldron = [
    new dialog_entry("Cauldron", c_white, spr_cauldron, new dialog_text("This is a cauldron. It's used by witches to brew potions and soup.") ),
    new dialog_entry("Cauldron", c_white, spr_cauldron, new dialog_text("Most potions brewed in them are beneficial to you but they also make you slightly more prone to corruption.") ),
    new dialog_entry("Cauldron", c_white, spr_cauldron, new dialog_text("The exact effects are determined by the ingredient used to brew, for example a potion of the roots of Chaka bush heals you.") )
]

global.dialog_hint_healing_potion = [
    new dialog_entry("Healing Potion", c_white, spr_heal_bottle, new dialog_text("This is a healing potion loot. If you pick it up you instantly drink it healing your current HP.") )
]

global.dialog_hint_playersheet = [
    new dialog_entry("Player sheet", c_white, undefined, new dialog_text($"Open your player sheet with your {key2str(global.input_playersheet)} key to get more information or equip gear.") )
]

global.dialog_hint_room1_leverpuzzle = [
    new dialog_entry("Note", c_white, spr_note, new dialog_text("You find a hastely scribbled note describing a room on fire with strange vibrant colors.") ),
    new dialog_entry("Note", c_green, spr_note, new dialog_text("You cannot make out most of the text just a small drawing on the bottom, which depicts four colors in a row: yellow, green, green, yellow") )
];

global.dialog_lore_room1_hiddensecret1 = [
    new dialog_entry("Note", c_white, spr_note, new dialog_text("Abandon all hope. Turn around while you can ..."))
];

global.dialog_room1_vendor = [
    new dialog_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text("I see you are persistent. Come take a look at my wares.")),
    new dialog_choice_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text($"Current coins: XXX. Options:"), [
        new dialog_vendor_item("Healing potion", 2, 2, function() {
            obj_player.hp = clamp(obj_player.hp + 5, 0, obj_player.hp_total);
            return true;
        }),
        new dialog_vendor_item("Corruption removal", 5, 100, function() {
            obj_player.add_corruption(-2);
            return true;
        }),
        new dialog_vendor_item("Cane of wisdom", 10, 1, function() {
            if (obj_player.addToInventory(obj_cane_of_wisdom)) {
                return true;
            }
            return false;
        }),
        new dialog_vendor_item("Talent potential", 10, 2, function() {
            obj_player.talent_points++;
            return true;
        })
    ])
];