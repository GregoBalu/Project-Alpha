// Inherit the parent event
event_inherited();

previous_location = new Vec2(xstart, ystart);
shroud_radius = 7.5;
default_shroud_mask = [];
current_shroud_mask = undefined;

blocking_shroud_mask_map = ds_map_create();
firstRoomEnter = true;


xp_total = get_xp_total(level);

unlocked_talents = ds_list_create();

sprite_index = spr_player_idle_down;

tilemap_hurt=layer_tilemap_get_id("Tiles_Back_Hurt");
tilemap_normal=layer_tilemap_get_id("Tiles_Back");
hurt_frame = 0;
hurt_cd_ticks = 0.3*TIME_SECOND;

talents = ds_list_create();

playersheet = instance_create_layer(x, y, layer_get_id("GUI"), obj_playersheet);
buff_bar = instance_create_layer(x, y, layer_get_id("GUI"), obj_buff_bar);
gui = instance_create_layer(x, y, layer_get_id("GUI"), obj_gui);
gui.depth = obj_playersheet.depth +1;
camera = instance_create_layer(0, 0, layer_get_id("Instances"), obj_camera);
camera.follow_point = new Vec2(x, y);

inventory = ds_map_create();
equipped_items = ds_map_create();
coins = 0;

debug_visualize_mp_grid = false;
statistic = new Statistic();
footstep_audio = noone;
last_footstep_frame = -1;

key_ring = new KeyRing();


audio_listener_orientation(0,1,0,0,0,1);

/**
* Calculate XP gain for player based on _enemy killed
* @param {Id.Instance} _enemy Enemy that is killed.
*/
gain_experience = function(_enemy) {
    show_debug_message("gain_experience()");
    
    var _level_difference = _enemy.level - level;
    var _modifier = power(1.25, _level_difference);
    var _base_xp = _enemy.base_xp;
    
    var _xp = _base_xp * _modifier;

    xp += _xp;
    statistic.total_xp += _xp;
    var _level_gained = 0;
    while (xp >= xp_total) {
        xp -= xp_total;
        level++;
        statistic.level_ups++;
        xp_total = get_xp_total(level);
        
        log_stat($"obj_player [gain_experience] level up -> {level}");
        _level_gained++;
        audio_play_sound(snd_achieve, 8, false);
        
        hp_total += 2;
        var _hp_begin = hp;
        hp = clamp(hp+3, 0, hp_total);
        var _actual_healing = hp - _hp_begin;
        statistic.healing_levelup += _actual_healing;
        statistic.healing_levelup_count++;
        damage += .3;
    }
    if (_level_gained > 0) {
        gain_talent(_level_gained);
    }
}

gain_talent = function(_num) {
    talent_points+= _num;
    statistic.talent_gains += _num;
    
    var _inst = instance_create_layer(0, 0, "GUI", obj_talent_picker);
}

change_shroud_mask = function(other_mask) {
    log_stat($"obj_player [change_shroud_mask] {other_mask}");
    current_shroud_mask = other_mask;
    shroud_set_fog();
    shroud_clear_position(x, y, no_see_tilemaps, current_shroud_mask);
}

change_orientation = function(_ori) {
    if (orientation != _ori) {
        orientation = _ori;
        if (is_holding_item) {
            change_shroud_mask(blocking_shroud_mask_map[? _ori]);
        } 
    }
}

pickedUpItem = function(_item) {
    log_stat($"obj_player [pickedUpItem] {_item}");
    is_holding_item = true;
    held_item = _item;
    change_shroud_mask(blocking_shroud_mask_map[? orientation]);
}

droppedItem = function(_item) {
    log_stat($"obj_player [droppedItem] {_item}");
    is_holding_item = false;
    held_item = undefined;
    change_shroud_mask(default_shroud_mask);
}

/**
 * Try add item to player inventory
 * @param {Asset.GMObject} _obj Object to add instance of
 * @param {Asset.InventorySlots} _slot Default Slot to add item to
 * @returns {bool} True if item is added to inventory, false if no space
 */
addToInventory = function(_obj, _slot = InventorySlots.Slot1) {
    if (ds_map_exists(inventory, _slot)) {
        if (!ds_map_exists(inventory, InventorySlots.Slot1)) {
            _slot = InventorySlots.Slot1;
        } else if (!ds_map_exists(inventory, InventorySlots.Slot2)) {
            _slot = InventorySlots.Slot2;
        } else if (!ds_map_exists(inventory, InventorySlots.Slot3)) {
            _slot = InventorySlots.Slot3;
        } else if (!ds_map_exists(inventory, InventorySlots.Slot4)) {
            _slot = InventorySlots.Slot4;
        } else if (!ds_map_exists(inventory, InventorySlots.Slot5)) {
            _slot = InventorySlots.Slot5;
        } else {
            show_debug_message("Inventory full");
            return false;
        }
    }
    
    var _inst = instance_create_layer(0, 0, "Instances", _obj, {
        visible:false
    });
    
    show_debug_message("Adding item '{0}' to slot: {1}", _inst.name, _slot);
    ds_map_add(inventory, _slot, _inst);
    return true;
}

equipItem = function(_fromInventorySlot) {
    if (!ds_map_exists(inventory, _fromInventorySlot)) {
        return;
    }
    
    if (!inventory[?_fromInventorySlot].is_equipable) {
        return;
    }
    
    var _eq_slot = inventory[?_fromInventorySlot].equip_slot;
    if (ds_map_exists(equipped_items, _eq_slot)) {
        //swap
        var _temp = equipped_items[?_eq_slot];
        _temp.unequip();
        equipped_items[?_eq_slot] = inventory[?_fromInventorySlot];
        inventory[?_fromInventorySlot] = _temp;
    } else {
        //equip
        equipped_items[?_eq_slot] = inventory[?_fromInventorySlot];
        ds_map_delete(inventory, _fromInventorySlot);
    }
    equipped_items[?_eq_slot].equip();
}

unequipItem = function(_equipSlot) {
    if (!ds_map_exists(equipped_items, _equipSlot)) {
        return false;
    }
    
    var _invSlot = undefined;
    if (!ds_map_exists(inventory, InventorySlots.Slot1)) {
        _invSlot = InventorySlots.Slot1;
    } else if (!ds_map_exists(inventory, InventorySlots.Slot2)) {
        _invSlot = InventorySlots.Slot2;
    } else if (!ds_map_exists(inventory, InventorySlots.Slot3)) {
        _invSlot = InventorySlots.Slot3;
    } else if (!ds_map_exists(inventory, InventorySlots.Slot4)) {
        _invSlot = InventorySlots.Slot5;
    } else if (!ds_map_exists(inventory, InventorySlots.Slot5)) {
        _invSlot = InventorySlots.Slot5;
    } else {
        return false;
    }
    
    equipped_items[?_equipSlot].unequip();
    inventory[?_invSlot] = equipped_items[?_equipSlot];
    ds_map_delete(equipped_items, _equipSlot);
    return true;
}

add_corruption = function(_amount) {
    if (_amount > 0 && corruption >= corruption_total ) {
        return;
    } else if (_amount < 0 && corruption <= 0) {
        return;
    }
    
    //TODO: add sound effect
    var _amt = _amount;
    if (_amt > 0) {
        statistic.corruption_gained += _amt;
    } else {
        statistic.corruption_lost += abs(_amt);
    }
    
    _amt = _amt * (1.0-corruption_resistance);
    
    corruption = clamp(corruption + _amt, 0, corruption_total);
    show_debug_message($"Corruption: {corruption}/{corruption_total}");
    if (corruption == corruption_total) {
        if (!spawn_ghost(tilemap_normal, collision_tilemaps)) {
            audio_play_sound(snd_ghost_whoosh, 6, false);
        }
    } else if (corruption >= corruption_total*0.8) {
        var _rand = random_range(0, 10);
        if (_rand < 2) {
            spawn_ghost(tilemap_normal, collision_tilemaps);
        } else {
            audio_play_sound(snd_ghost_whoosh, 6, false);
        }
    }
}

onBattleDamageReceived = function(_damaged_amount) {
    var _rand = choose(snd_player_hurt1, snd_player_hurt2, snd_player_hurt3);
    audio_play_sound(_rand, 4, false, 1, 0, random_range(0.8, 1.1));
}
