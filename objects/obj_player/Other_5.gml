
if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    _inst.player_data = {
        xp : self.xp,
        xp_total : self.xp_total,
        corruption : self.corruption,
        corruption_total: self.corruption_total,
        luck: self.luck,
        talent_points: self.talent_points,
        unlocked_talents: ds_list_create(),
        inventory: ds_map_create(),
        equipped_items: ds_map_create(),
        coins: self.coins
    };
    ds_list_copy(_inst.player_data.unlocked_talents, self.unlocked_talents);
    ds_map_copy(_inst.player_data.inventory, self.inventory);
    ds_map_copy(_inst.player_data.equipped_items, self.equipped_items);
    
    clone_to(_inst.player_data);
}
