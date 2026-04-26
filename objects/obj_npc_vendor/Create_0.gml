// Inherit the parent event
event_inherited();

vendor_dialog = noone;
stock = [];

if (room == rm_dungeon) {
    stock = [
        new VendorItem(getText("Vendor_hp_potion"), getText("Vendor_hp_potion_desc"), spr_heal_bottle, 2, 3, function() {
            obj_player.hp = clamp(obj_player.hp + 5, 0, obj_player.hp_total);
            return true;
        }),
        new VendorItem(getText("Vendor_corruption_remove"), getText("Vendor_corruption_remove_desc"), spr_debug_16, 5, 20, function() {
            obj_player.add_corruption(-2);
            return true;
        }),
        new VendorItem(getText("Vendor_cane"), getText("Vendor_cane_desc"), spr_crane_of_wisdom, 10, 1, function() {
            if (obj_player.addToInventory(obj_cane_of_wisdom)) {
                return true;
            }
            return false;
        }),
        new VendorItem(getText("Vendor_talent"), getText("Vendor_talent_desc"), spr_star, 10, 1, function() {
            obj_player.talent_points++;
            return true;
        })
    ];
    
} else if (room == rm_cave) {
    stock = [
         new VendorItem(getText("Vendor_hp_potion"), getText("Vendor_hp_potion_desc"), spr_heal_bottle, 2, 2, function() {
            obj_player.hp = clamp(obj_player.hp + 5, 0, obj_player.hp_total);
            return true;
        }),
        new VendorItem(getText("Vendor_corruption_remove"), getText("Vendor_corruption_remove_desc"), spr_debug_16, 5, 20, function() {
            obj_player.add_corruption(-2);
            return true;
        }),
        new VendorItem(getText("Vendor_cane"), getText("Vendor_cane_desc"), spr_crane_of_wisdom, 10, 1, function() {
            if (obj_player.addToInventory(obj_cane_of_wisdom)) {
                return true;
            }
            return false;
        }),
        new VendorItem(getText("Vendor_platearmor"), getText("Vendor_platearmor_desc"), spr_plate_armor, 10, 1, function() {
            if (obj_player.addToInventory(obj_plate_armor)) {
                return true;
            }
            return false;
        }),
        new VendorItem(getText("Vendor_talent"), getText("Vendor_talent_desc"), spr_star, 15, 1, function() {
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