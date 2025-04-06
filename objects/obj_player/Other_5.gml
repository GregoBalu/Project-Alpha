
if (instance_exists(obj_room_switcher)) {
    var _inst = instance_find(obj_room_switcher, 0);
    _inst.player_data = {
        xp : self.xp,
        xp_total : self.xp_total,
        corruption : self.corruption,
        corruption_total: self.corruption_total,
        luck: self.luck,
        talent_points: self.talent_points,
        unlocked_talents: self.unlocked_talents,
        inventory: self.inventory,
        equipped_items: self.equipped_items,
        coins: self.coins
    };
    clone_to(_inst.player_data);
}
