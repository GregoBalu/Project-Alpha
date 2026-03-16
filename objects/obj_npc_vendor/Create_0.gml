// Inherit the parent event
event_inherited();

vendor_dialog = noone;
stock = [];

if (room == Room1) {
    stock = [
        new VendorItem(getText("Vendor_hp_potion"), spr_heal_bottle, 2, 3, function() {
            obj_player.hp = clamp(obj_player.hp + 5, 0, obj_player.hp_total);
            return true;
        }),
        new VendorItem(getText("Vendor_corruption_remove"), spr_debug_16, 5, 3, function() {
            obj_player.add_corruption(-2);
            return true;
        }),
        new VendorItem(getText("Vendor_cane"), spr_crane_of_wisdom, 10, 1, function() {
            if (obj_player.addToInventory(obj_cane_of_wisdom)) {
                return true;
            }
            return false;
        }),
        new VendorItem(getText("Vendor_talent"), spr_star, 10, 1, function() {
            obj_player.talent_points++;
            return true;
        })
    ];
    
} else if (room == rm_cave) {
    stock = [
         new VendorItem(getText("Vendor_hp_potion"), spr_heal_bottle, 2, 2, function() {
            obj_player.hp = clamp(obj_player.hp + 5, 0, obj_player.hp_total);
            return true;
        }),
        new VendorItem(getText("Vendor_corruption_remove"), spr_debug_16, 5, 3, function() {
            obj_player.add_corruption(-2);
            return true;
        }),
        new VendorItem(getText("Vendor_cane"), spr_crane_of_wisdom, 10, 1, function() {
            if (obj_player.addToInventory(obj_cane_of_wisdom)) {
                return true;
            }
            return false;
        }),
        new VendorItem(getText("Vendor_talent"), spr_star, 20, 1, function() {
            instance_create_layer(obj_npc_vendor.x, obj_npc_vendor.y, "Items", obj_talent_star);
            return true;
        })
    ];
}

/*for (var _i = 0; _i < array_length(dialog); ++_i)
{
    if (dialog[_i].type == DialogType.Choice) {
        for (var _j = 0; _j < array_length(dialog[_i].choices); ++_j)
        {
            dialog[_i].choices[_j].reset();
        }
    }
}*/