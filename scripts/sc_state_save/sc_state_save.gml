function save_player_data_to(_inst){
    _inst.player_data = {
        xp : self.xp,
        xp_total : self.xp_total,
        corruption : self.corruption,
        corruption_total: self.corruption_total,
        talents: ds_list_create(),
        talent_points: self.talent_points,
        unlocked_talents: ds_list_create(),
        inventory: ds_map_create(),
        equipped_items: ds_map_create(),
        coins: self.coins,
        statistic: self.statistic,
        key_ring: self.key_ring
    };
    ds_list_copy(_inst.player_data.talents, self.talents);
    ds_list_copy(_inst.player_data.unlocked_talents, self.unlocked_talents);
    ds_map_copy(_inst.player_data.inventory, self.inventory);
    ds_map_copy(_inst.player_data.equipped_items, self.equipped_items);
    
    self.clone_to(_inst.player_data);
}

function load_player_data_from(_inst) {
    clone_from(_inst.player_data);
    
    xp = _inst.player_data.xp;
    xp_total = _inst.player_data.xp_total;
    corruption = _inst.player_data.corruption;
    corruption_total = _inst.player_data.corruption_total;
    ds_list_copy(talents, _inst.player_data.talents);
    talent_points = _inst.player_data.talent_points;
    ds_list_copy(unlocked_talents, _inst.player_data.unlocked_talents);
    ds_map_copy(inventory, _inst.player_data.inventory);
    ds_map_copy(equipped_items, _inst.player_data.equipped_items);
    coins = _inst.player_data.coins;
    statistic = _inst.player_data.statistic;
    key_ring = _inst.player_data.key_ring;
}

