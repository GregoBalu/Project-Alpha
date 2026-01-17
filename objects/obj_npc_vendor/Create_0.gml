// Inherit the parent event
event_inherited();



if (room == Room1) {
    dialog = [
        new dialog_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text("I see you are persistent. Come take a look at my wares.")),
        new dialog_choice_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text($"Current coins: {obj_player.coins}. Options:"), [
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
    
} else if (room == rm_cave) {
    dialog = [
        new dialog_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text("We meet again. Come look at my goods or you will face death quickly.")),
        new dialog_choice_entry(global.dialog_vendor_name, global.dialog_vendor_color, spr_npc_vendor, new dialog_text($"Current coins: {obj_player.coins}. Options:"), [
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
            new dialog_vendor_item("Talent Star", 20, 1, function() {
                instance_create_layer(obj_npc_vendor.x, obj_npc_vendor.y, "Items", obj_talent_star);
                return true;
            })
        ])
    ];
}

for (var _i = 0; _i < array_length(dialog); ++_i)
{
    if (dialog[_i].type == DialogType.Choice) {
        for (var _j = 0; _j < array_length(dialog[_i].choices); ++_j)
        {
            dialog[_i].choices[_j].reset();
        }
    }
}