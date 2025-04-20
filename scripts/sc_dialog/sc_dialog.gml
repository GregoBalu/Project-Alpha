function initDialog() {
    initInput();
}
initInput();

function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
};

enum DialogType { Chat, Choice };

/**
 * Create a new Dialog text element
 * @param {string} _msg Text
 * @param {Asset.GMFont} [_msg_font]=font_base Font of text
 * @param {Constant.Color} [_msg_color]=c_ltgray Color of text
 */
function dialog_text(_msg, _msg_font = font_base, _msg_color = c_ltgray) constructor {
    
    text = _msg;
    font = _msg_font;
    color = _msg_color;
}

/**
 *  Create a new simple Dialog entry
 * @param {string} _name  Name of the speaker
 * @param {Constant.Color} _color  Color of the speaker's name
 * @param {Asset.GMSprite} _sprite  The sprite of the speaker.
 * @param {struct.dialog_text} _msg  The message the speaker says
 * @param {function} [_on_start_action]=function(){} Function to call on the first frame of this dialog
 * @param {function} [_on_end_action]=function(){} Function to call on after the last frame of this dialog
 * @returns {struct}  Dialog struct
 */
function dialog_entry(_name, _color, _sprite, _msg, 
        _on_start_action = function(){}, _on_end_action = function(){}) constructor {
    
    type = DialogType.Chat;
    name = _name;
    color = _color;
    spr = _sprite;
    msg = _msg;
            
    _startAction = _on_start_action;
    _endAction = _on_end_action;
    onStart = function() { _startAction(); }
    onEnd = function() { _endAction(); }
}

/**
 * Create a new Choice Dialog text element
 * @param {string} _text Text
 * @param {function} _on_click_action Function to call on this choice being clicked
 * @param {function} [_cond_action] Function to check appearance condition of this choice
 * @param {Asset.GMFont} [_font]=font_base Font of text
 * @param {Constant.Color} [_color]=c_ltgray Color of text
 */
function dialog_choice_text(_text, _on_click_action, _cond_action = function() { return true; }, _font = font_base, _color = c_ltgray) : dialog_text(_text, _font, _color) constructor {
    
    _condAction = _cond_action;
    function condition() {
        return _condAction();
    }
    
    _clickAction = _on_click_action;
    function onClick() {
        _clickAction();
    }
}

/**
 * Create a new vendor item choice dialog entry
 * @param {string} _name Name of item to sell
 * @param {real} _price Price of the item
 * @param {real} _stock Number of items the vendor has of this type
 * @param {function} _on_click_action Function to call on this choice being clicked
 */
function dialog_vendor_item(_name, _price, _stock, _on_click_action) : dialog_choice_text(string_concat(_name, " ... ", _price, "g"), _on_click_action, function() { return true; }, font_base_italic ) constructor {
    
    price = _price;
    stock = _stock;
    _condAction = function() {
        return stock > 0 && obj_player.coins >= price;
    }
    
    onClick = function() {
        if (!_clickAction()) {
            return false;
        }
        stock--;
        obj_player.coins -= price;
        audio_play_sound(snd_coin_drop, 5, false);
        return true;
    }
}

/**
 *  Create a new Choice dialog entry
 * @param {string} _name  Name of the speaker
 * @param {Constant.Color} _color  Color of the speaker's name
 * @param {Asset.GMSprite} _sprite  The sprite of the speaker.
 * @param {struct.dialog_text} _msg  The message the speaker says
 * @param {Array.dialog_choice_text} _choices The choices the player can take.
 * @param {function} _on_start_action  function(){} Function to call on the first frame of this dialog
 * @param {function} [_on_end_action]=function(){} Function to call on after the last frame of this dialog
 * @returns {struct}  Dialog struct
 */
function dialog_choice_entry(_name, _color, _sprite, _msg, _choices, 
        _on_start_action = function(){}, _on_end_action = function(){}) : 
            dialog_entry(_name, _color, _sprite, _msg, _on_start_action, _on_end_action) constructor {
            
    type = DialogType.Choice;
    choices = _choices;
}

global.dialog_player_name = "Omar";
global.dialog_player_color = c_lime;

global.dialog_vendor_name = "Sha'd Yvend'r";
global.dialog_vendor_color = c_orange;

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

global.dialog_hint_cauldron = [
    new dialog_entry("Cauldron", c_white, spr_cauldron, new dialog_text("This is a cauldron. It's used by witches to brew potions and soup.") ),
    new dialog_entry("Cauldron", c_white, spr_cauldron, new dialog_text("Most potions brewed in them are beneficial to you but they also make you slightly more prone to corruption.") ),
    new dialog_entry("Cauldron", c_white, spr_cauldron, new dialog_text("The exact effects are determined by the ingredient used to brew, for example a potion of the roots of Chaka bush heals you.") )
]

global.dialog_hint_healing_potion = [
    new dialog_entry("Healing Potion", c_white, spr_heal_bottle, new dialog_text("This is a healing potion loot. If you pick it up you instantly drink it healing your current HP.") )
]

global.dialog_hint_playersheet = [
    new dialog_entry("Player sheet", c_white, undefined, new dialog_text($"Open your player sheet with your {key2str(global.input_playersheet)} key to get more information or acquire new talents and equip gear") )
]

global.dialog_hint_room1_leverpuzzle = [
    new dialog_entry("Note", c_white, spr_note, new dialog_text("You find a hastely scribbled note describing a room on fire with strange vibrant colors.") ),
    new dialog_entry("Note", c_green, spr_note, new dialog_text("You cannot make out most of the text just a small drawing on the bottom, which depicts four colors in a row: yellow, green, green, yellow") )
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
        new dialog_vendor_item("Crane of wisdom", 10, 1, function() {
            if (obj_player.addToInventory(obj_crane_of_wisdom)) {
                return true;
            }
            return false;
        })
    ])
];

global.dialog_cave_vendor = [
    new dialog_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text("We meet again. Come look at my goods or you will face death quickly.")),
    new dialog_choice_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text($"Current coins: XXX. Options:"), [
        new dialog_vendor_item("Healing potion", 2, 2, function() {
            obj_player.hp = clamp(obj_player.hp + 5, 0, obj_player.hp_total);
            return true;
        }),
        new dialog_vendor_item("Corruption removal", 5, 100, function() {
            obj_player.add_corruption(-2);
            return true;
        }),
        new dialog_vendor_item("Crane of wisdom", 10, 1, function() {
            if (obj_player.addToInventory(obj_crane_of_wisdom)) {
                return true;
            }
            return false;
        })
    ])
];


