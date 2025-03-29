function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
};

dialog_player_name = "Omar";
dialog_player_color = c_lime;

dialog_welcome = [
{
    name: "Geoff",
    color: c_aqua,
    msg: "Hey, I started to worry you wouldn't show up at all. What took you so long?",
    msg_font: font_base,
    msg_color: c_ltgray
},
{
    name: dialog_player_name,
    color: dialog_player_color,
    msg: "Sorry, I got held up by the guards at the city exit. So where is this Witch you were talking about?",
    msg_font: font_base,
    msg_color: c_ltgray
},
{
    name: "Geoff",
    color: c_aqua,
    msg: "She ... It went deep inside this dungeon of sort but it may know our plan. It started to prepare. Be on your guard!",
    msg_font: font_base,
    msg_color: c_ltgray
},
{
    name: dialog_player_name,
    color: dialog_player_color,
    msg: "Will do. Any sign of corruption yet? ...",
    msg_font: font_base,
    msg_color: c_ltgray
},
{
    name: "",
    color: c_white,
    msg: "<A loud bang shakes the ground>",
    msg_font: font_base_italic,
    msg_color: c_ltgray
},
{
    name: dialog_player_name,
    color: dialog_player_color,
    msg: "Nevermind, I'll get started!",
    msg_font: font_base,
    msg_color: c_ltgray
}
];
dialog_welcome_alt = [
{
    name: "Geoff",
    color: c_aqua,
    msg: "Get in there and slay that Witch!",
    msg_font: font_base,
    msg_color: c_ltgray
}
];





