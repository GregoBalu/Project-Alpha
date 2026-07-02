
var is_visible = state != State.Closed;

if (is_visible) {
   
    display_set_gui_size(320, 180);
    draw_set_font(font_base);
    
    var _x = 2;
    var _y = 2;
    var _sheetWidth = opening_state;
    var _height = 176;
    
    draw_sprite_stretched(spr_gui_back, 0, _x, _y, _sheetWidth, _height);
    if (state != State.Open) {
        draw_sprite_stretched(spr_gui_back_roll, ((opening_state%(100))>(50))?1:0, _x + _sheetWidth - 32, _y, 32, _height);
    }
    
    if (opening_state-32 > 160+30) {
        draw_textbox(160, _y + 4, 60, 20, title, fa_center, fa_top);
    }
    
    var _yshift = 0;
    if (opening_state-32 > (_x+8+48)) {
        var _hp_percent = (obj_player.hp/obj_player.hp_total);
        var _hp_color = c_green;
        if (.20 < _hp_percent && _hp_percent <= .50) {
            _hp_color = c_yellow;
        } else if (_hp_percent <= .20) {
            _hp_color = c_red;
        }
        draw_textbox(_x + 32, _y + 18, 42, 6, $"{hp_label}: {obj_player.hp} / {obj_player.hp_total}", fa_center);
        draw_progress_bar(_x + 8, _y + 24, 48, 6, _hp_percent, _hp_color);
    }
    _yshift += 30;
    if (opening_state-32 > (_x+8+48)) {
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, atkchrg_label, fa_center);
        draw_progress_bar(_x + 8, _y + _yshift + 12, 48, 6, (obj_player.charge_attack/obj_player.charge_attack_total), Color_AttackCharge);
    }
    _yshift += 12;
    if (opening_state-32 > (_x+8+48)) {
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, utlchrg_label, fa_center);
        draw_progress_bar(_x + 8, _y + _yshift + 12, 48, 6, (obj_player.charge_util/obj_player.charge_util_total), Color_UtilityCharge);
    }
    
    
    _yshift += 18;
    if (opening_state-32 > (_x+8+48)) {
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, $"{level_label}: {obj_player.level}", fa_center);
        _yshift += 6;
        var _xp_percent = (obj_player.xp/obj_player.xp_total);
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, $"{xp_label}: {obj_player.xp} / {obj_player.xp_total}", fa_center);
        draw_progress_bar(_x + 8, _y + _yshift + 12, 48, 6, _xp_percent, Color_XP);
    }
    
    _yshift += 22;
    if (opening_state-32 > (_x+8+48)) {
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, $"{dmg_label}: {obj_player.damage}");
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, $"{spd_label}: {obj_player.move_speed}");
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, $"{def_label}: {obj_player.defense}");
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, $"{crit_label}: {obj_player.crit_chance*100}%");
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, $"{lifesteal_label}: {obj_player.lifesteal*100}%");
        _yshift += 6;
    }
    
    
    
    
    
    
    if (opening_state-32 > (_x + 64 + 2) ) {
        //divider
        draw_line_width_color(_x + 64, _y + 16, _x + 64, _y + _height - 16, 2, c_black, c_black);
    }
    
    if (opening_state-32 > (_x + 72 + 64) ) {
        draw_textbox(_x + 72, _y + 18, 128, 8, $"{avail_talent_label}: {obj_player.talent_points}", undefined, undefined, 0.3);
    }
    
    var _talentSectionEndX = 205;
    
    //draw_textbox(_x + 70, _y +16, 230, 150, "TALENTS");
    var _talentWidth = 20;
    var _talentHeight = 20;
    var _gapX = 10;
    var _gapY = 10;
    
    var _talentsPerRow = (_x+_talentSectionEndX - (_x+70)) div (_talentWidth + _gapX);
    //show_debug_message($"_talentsPerRow={_talentsPerRow}");
    if (_talentsPerRow < 1) {
        return;
    }
    
    var _do_draw_hint = false;
    var _draw_hint_data = {};

    //talents
    var _list = obj_player.unlocked_talents;
    for (var _i = 0; _i < ds_list_size(_list); _i++)
    {
        var _row = _x + 70 + _gapX + (_i mod _talentsPerRow) * (_talentWidth + _gapX);
        
        //show_debug_message($"row: {_row}");
        if (opening_state != max_open_state && (_row + _talentWidth) > (opening_state-32)) {
            //show_debug_message ("skip");
            continue;
        }
        
        var _col = _y + 16 + _gapY + (_i div _talentsPerRow) * (_talentHeight + _gapY);
        var _hasCost = checkTalentCost(_list[|_i]);
        var _alpha = _hasCost?1:0.3;
        var _color = #DDDDDD;
        var _isMouseOver = false;
        if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _row, _col, _row+_talentWidth, _col+_talentHeight)) {
            _isMouseOver = true;
        }
        
        var _talentCanInterract = !_list[|_i].unlocked || (_list[|_i].stackable && _list[|_i].current_stack < _list[|_i].max_stacks);
        var _talentMaxedOut = _list[|_i].unlocked && (!_list[|_i].stackable || _list[|_i].current_stack == _list[|_i].max_stacks);
        
        if (!_talentCanInterract) {
            _color = #EEEEEE;
        } else if (_isMouseOver && _hasCost) {
            _color = #FFFFFF;
        }
        
        draw_sprite_stretched_ext(_list[|_i].sprite_index, 0, _row, _col, _talentWidth, _talentHeight, _color, _alpha);
        if (_list[|_i].cost_amount == 1) {
            draw_sprite(spr_talent_cost_1, 0, _row-3, _col-2);
        } else if (_list[|_i].cost_amount == 2) {
            draw_sprite(spr_talent_cost_2, 0, _row-3, _col-2);
        } else if (_list[|_i].cost_amount == 3) {
            draw_sprite(spr_talent_cost_3, 0, _row-3, _col-2);
        }
        
        if (_list[|_i].unlocked) {
            draw_sprite_stretched_ext(spr_highlight, 0, _row-_gapX/4, _col-_gapY/4, _talentWidth+_gapX/2, _talentHeight+_gapY/2, c_white, 0.5);
        }
        
        draw_textbox(_row + _talentWidth/2, _col+_talentHeight, _talentWidth+_gapX/2, _gapY, _list[|_i].name, fa_center, undefined, 0.1);
        
        if (_talentMaxedOut) {
            draw_sprite_stretched_ext(spr_check, 0, _row+_talentWidth/2, _col+_talentHeight/2, _talentWidth/2, _talentHeight/2, c_green, 1);
        } else if (_list[|_i].unlocked) {
            draw_sprite_stretched_ext(spr_check, 0, _row+_talentWidth/2, _col+_talentHeight/2, _talentWidth/2, _talentHeight/2, c_yellow, 1);
            draw_textbox(_row +_talentWidth-5, _col-1, 6, 6, $"{_list[|_i].current_stack}/{_list[|_i].max_stacks}");
        }
        
        if (_isMouseOver) {
            _do_draw_hint = true;
            
            var _hint_x = _row;
            var _halign = fa_left;
            if (_hint_x > display_get_gui_width()/2) {
                //_hint_x -= (_talentWidth+2);
                _halign = fa_right;
            } else {
                _hint_x += (_talentWidth+2);
            }
            _draw_hint_data = {
                hint_x : _hint_x,
                hint_y : clamp(mouse_gui_y, _col+5, _col+_talentHeight-5),
                hint : _list[|_i].hint,
                halign : _halign,
                valign : fa_top
            };
        }
    
        if (_talentCanInterract && _isMouseOver && mouse_check_button_pressed(mb_left)) {
            _list[|_i].action();
        }
    }
    
    if (opening_state-32 > (_x + _talentSectionEndX + 2) ) {
        //divider
        draw_line_width_color(_x + _talentSectionEndX, _y + 16, _x + _talentSectionEndX, _y + _height - 16, 2, c_black, c_black);
    }
    
    //equipment
    if (opening_state-32 > (_x + _talentSectionEndX + 8 + 64) ) {
        var _invX = _x + _talentSectionEndX + 8;
        var _invY = _y + 24;
        var _invGap = 4;
        
        var _invSlotW = 24;
        var _invSlotH = 24;
        
        draw_sprite_stretched_ext(spr_human_mesh, 0, _invX, _invY-4, _invSlotW*4, _invSlotH*4, c_gray, 0.75);
        
        function drawArmorSlot(_slot, _x, _y, _w, _h, _margin) {
            //draw_sprite_stretched_ext(spr_gui_slot, 0, _x, _y , _w, _h, #C0C0C0, 1);
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_w, _y+_h)) {
                if (_draggingItem && mouse_check_button_released(mb_left)) {
                    if (_dragSlotFromEquipment == _slot) {
                        //skip, cannot swap with itself
                    } else if (_dragSlotFromInventory != undefined && obj_player.canItemEquipTo(_dragSlotFromInventory, _slot)) {
                        obj_player.equipItem(_dragSlotFromInventory);
                    } else if (_dragSlotFromEquipment != undefined) {
                        //skip, cannot swap a helmet with armor
                    }
                    _draggingItem = false;
                    _dragSlotFromInventory = undefined;
                    _dragSlotFromEquipment = undefined;
                }
            }
            
            if (ds_map_exists(obj_player.equipped_items, _slot) ) {
                //show_debug_message($"Draw {_slot} slot");
                if (_draggingItem && _dragSlotFromEquipment == _slot) {
                    draw_sprite_stretched(obj_player.equipped_items[?_slot].sprite_index, 
                        obj_player.equipped_items[?_slot].image_index, 
                        mouse_gui_x, mouse_gui_y, _w -(2*_margin), _h-(2*_margin));
                } else {
                    draw_sprite_stretched(obj_player.equipped_items[?_slot].sprite_index, 
                        obj_player.equipped_items[?_slot].image_index, 
                        _x + _margin, _y + _margin, _w -(2*_margin), _h-(2*_margin));
                }
                
                if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_w, _y+_h)) {
                    if (!_draggingItem && mouse_check_button_pressed(mb_right)) {
                        obj_player.unequipItem(_slot);
                        return undefined;
                    } else if (!_draggingItem && mouse_check_button_pressed(mb_left)) {
                        _draggingItem = true;
                        _dragSlotFromEquipment = _slot;
                        _dragSlotFromInventory = undefined;
                        return undefined;
                    } else if (_draggingItem) return undefined;
                    var _hint_x = clamp(mouse_gui_x, _x+_margin, _x+_w-_margin);
                    var _halign = fa_left;
                    if (_hint_x > display_get_gui_width()/2) {
                        _halign = fa_right;
                    } else {
                        _hint_x += (_talentWidth+2);
                    }
                    return {
                        hint_x : _hint_x,
                        hint_y : clamp(mouse_gui_y, _y+_margin, _y+_h-_margin),
                        hint : obj_player.equipped_items[?_slot].name + "\n" + obj_player.equipped_items[?_slot].description,
                        halign : _halign,
                        valign : fa_top
                    };
                }
            }
            return undefined;
        }
        
        var _gui_slot_color = #C0C0C0;
        
        var _hint_data = {};
        var _equip_size = new Vec2(_invSlotW, _invSlotH);
        var _hint_slot_ratio = 0.7;
        var _hint_size = new Vec2(_invSlotW*_hint_slot_ratio, _invSlotH*_hint_slot_ratio);
        var _hint_offset = new Vec2((_invSlotW-_hint_size.x)/2, (_invSlotH-_hint_size.y)/2);
        var _helmet_pos = new Vec2(_invX+_invSlotW*1.5, _invY);
        var _armor_pos = new Vec2(_invX+_invSlotW*1.5, _invY+(_invSlotW+_invGap)*2);
        _invY+=(_invGap+_invSlotH)*2;
        var _ring_pos = new Vec2(_invX, _invY);
        var _weapon_pos = new Vec2(_invX + (_invSlotW)*3, _invY);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _helmet_pos.x, _helmet_pos.y, _equip_size.x, _equip_size.y, (_draggingItem && _dragSlotFromInventory!= undefined && obj_player.canItemEquipTo(_dragSlotFromInventory, EquipSlot.Helmet))?#FFFFFF:_gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_helmet_hint, 0, _helmet_pos.x+_hint_offset.x, _helmet_pos.y+_hint_offset.y, _hint_size.x, _hint_size.y, _gui_slot_color, 0.5);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _armor_pos.x, _armor_pos.y, _equip_size.x, _equip_size.y, (_draggingItem && _dragSlotFromInventory!= undefined && obj_player.canItemEquipTo(_dragSlotFromInventory, EquipSlot.Armor))?#FFFFFF:_gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_armor_hint, 0, _armor_pos.x+_hint_offset.x, _armor_pos.y+_hint_offset.y, _hint_size.x, _hint_size.y, _gui_slot_color, 0.5);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _ring_pos.x, _ring_pos.y, _equip_size.x, _equip_size.y, (_draggingItem && _dragSlotFromInventory!= undefined && obj_player.canItemEquipTo(_dragSlotFromInventory, EquipSlot.Ring))?#FFFFFF:_gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_ring_hint, 0, _ring_pos.x+_hint_offset.x, _ring_pos.y+_hint_offset.y, _hint_size.x, _hint_size.y, _gui_slot_color, 0.5);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _weapon_pos.x, _weapon_pos.y, _equip_size.x, _equip_size.y, (_draggingItem && _dragSlotFromInventory!= undefined && obj_player.canItemEquipTo(_dragSlotFromInventory, EquipSlot.Weapon))?#FFFFFF:_gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_weapon_hint, 0, _weapon_pos.x+_hint_offset.x, _weapon_pos.y+_hint_offset.y, _hint_size.x, _hint_size.y, _gui_slot_color, 0.5);
        
        _invY += _invSlotH + _invSlotH + _invGap;
        _invSlotW = 16;
        _invSlotH = 16;
        _invGap = 2;
        var _invItemMargin = 2;
        
        _gui_slot_color = #C0C0C0;
        if (_draggingItem && _dragSlotFromEquipment != undefined) {
            _gui_slot_color = #FFFFFF;
        }
        
        var _inv_size = new Vec2(_invSlotW, _invSlotH);
        var _1_pos = new Vec2(_invX + _invGap, _invY);
        var _2_pos = new Vec2(_invX + _invGap+(_invGap + _invSlotW), _invY);
        var _3_pos = new Vec2(_invX + _invGap+(_invGap + _invSlotW)*2, _invY);
        var _4_pos = new Vec2(_invX + _invGap+(_invGap + _invSlotW)*3, _invY);
        var _5_pos = new Vec2(_invX + _invGap+(_invGap + _invSlotW)*4, _invY);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _1_pos.x, _1_pos.y , _inv_size.x, _inv_size.y, _gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _2_pos.x, _2_pos.y , _inv_size.x, _inv_size.y, _gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _3_pos.x, _3_pos.y , _inv_size.x, _inv_size.y, _gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _4_pos.x, _4_pos.y , _inv_size.x, _inv_size.y, _gui_slot_color, 1);
        draw_sprite_stretched_ext(spr_gui_slot, 0, _5_pos.x, _5_pos.y , _inv_size.x, _inv_size.y, _gui_slot_color, 1);
        
        
        _hint_data = drawArmorSlot(EquipSlot.Helmet, _helmet_pos.x, _helmet_pos.y, _equip_size.x, _equip_size.y, 2);
        _hint_data = drawArmorSlot(EquipSlot.Armor, _armor_pos.x, _armor_pos.y, _equip_size.x, _equip_size.y, 2) ?? _hint_data;
        _hint_data = drawArmorSlot(EquipSlot.Ring, _ring_pos.x, _ring_pos.y, _equip_size.x, _equip_size.y, 2) ?? _hint_data;
        _hint_data = drawArmorSlot(EquipSlot.Weapon, _weapon_pos.x, _weapon_pos.y, _equip_size.x, _equip_size.y, 2) ?? _hint_data;
        
        function drawInventorySlot(_slot, _x, _y, _w, _h, _margin) {
            //draw_sprite_stretched_ext(spr_gui_slot, 0, _x, _y , _w, _h, #C0C0C0, 1);
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_w, _y+_h)) {
                if (_draggingItem && mouse_check_button_released(mb_left)) {
                    if (_dragSlotFromInventory == _slot) {
                        //skip, cannot swap with itself
                    } else if (_dragSlotFromInventory != undefined) {
                        obj_player.swapInventory(_dragSlotFromInventory, _slot);
                    } else if (_dragSlotFromEquipment != undefined) {
                        obj_player.unequipItem(_dragSlotFromEquipment, _slot);
                    }
                    _draggingItem = false;
                    _dragSlotFromInventory = undefined;
                    _dragSlotFromEquipment = undefined;
                }
            }
            if (ds_map_exists(obj_player.inventory, _slot) ) {
                //show_debug_message($"Draw {_slot} slot");
                if (_draggingItem && _dragSlotFromInventory == _slot) {
                    draw_sprite_stretched(obj_player.inventory[?_slot].sprite_index, 
                            obj_player.inventory[?_slot].image_index, 
                            mouse_gui_x, mouse_gui_y, _w -(2*_margin), _h-(2*_margin));
                } else {
                    draw_sprite_stretched(obj_player.inventory[?_slot].sprite_index, 
                            obj_player.inventory[?_slot].image_index, 
                            _x + _margin, _y + _margin, _w -(2*_margin), _h-(2*_margin));
                }
                if (_draggingItem) return undefined;
                if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_w, _y+_h)) {
                    if (!_draggingItem && mouse_check_button_pressed(mb_right)) {
                        obj_player.equipItem(_slot);
                        return undefined;
                    } else if (!_draggingItem && mouse_check_button_pressed(mb_left)) {
                        _draggingItem = true;
                        _dragSlotFromInventory = _slot;
                        _dragSlotFromEquipment = undefined;
                        return undefined;
                    } else if (_draggingItem) return undefined;
                    var _hint_x = clamp(mouse_gui_x, _x+_margin, _x+_w-_margin);
                    var _halign = fa_left;
                    if (_hint_x > display_get_gui_width()/2) {
                        _halign = fa_right;
                    } else {
                        _hint_x += (_talentWidth+2);
                    }
                    return {
                        hint_x : _hint_x,
                        hint_y : clamp(mouse_gui_y, _y+_margin, _y+_h-_margin),
                        hint : obj_player.inventory[?_slot].name + "\n" + obj_player.inventory[?_slot].description,
                        halign : _halign,
                        valign : fa_top
                    };
                }
            }
            return undefined;
        }
        
        _hint_data = drawInventorySlot(InventorySlots.Slot1, _1_pos.x, _1_pos.y, _inv_size.x, _inv_size.y, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot2, _2_pos.x, _2_pos.y, _inv_size.x, _inv_size.y, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot3, _3_pos.x, _3_pos.y, _inv_size.x, _inv_size.y, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot4, _4_pos.x, _4_pos.y, _inv_size.x, _inv_size.y, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot5, _5_pos.x, _5_pos.y, _inv_size.x, _inv_size.y, _invItemMargin) ?? _hint_data;
        
        //coins
        var _footer_x = _invX - _invGap*3 ;
        {
            _invY += _invSlotH + _invGap;
            var _coins_x = _footer_x;
            var _coins_y = _invY;
            draw_sprite_stretched_ext(spr_coin, 0, _footer_x, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
            _footer_x += _invSlotW + _invGap+_invGap;
            draw_textbox(_footer_x, _invY+_invGap, _invSlotW-2*_invGap, _invSlotH-2*_invGap, $"x{obj_player.coins}");
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _coins_x, _coins_y, _footer_x+_invSlotW-2*_invGap, _invY+_invSlotH-2*_invGap)) {
                _do_draw_hint = true;
                _draw_hint_data = {
                    hint_x : mouse_gui_x,
                    hint_y : mouse_gui_y,
                    hint : coins_hint,
                    halign : fa_right,
                    valign: fa_bottom
                };
            }
        }
        
        //divine symbols
        {
            _footer_x += _invSlotW + _invGap;
            var _symbol_x = _footer_x;
            var _symbol_y = _invY;
            draw_sprite_stretched_ext(spr_divine_symbol, 0, _footer_x, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
            _footer_x += _invSlotW + _invGap;
            draw_textbox(_footer_x, _invY+_invGap, _invSlotW-2*_invGap, _invSlotH-2*_invGap, $"x{obj_player.divine_symbols}");
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _symbol_x, _symbol_y, _footer_x+_invSlotW-2*_invGap, _invY+_invSlotH-2*_invGap)) {
                _do_draw_hint = true;
                _draw_hint_data = {
                    hint_x : mouse_gui_x,
                    hint_y : mouse_gui_y,
                    hint : symbols_hint,
                    halign : fa_right,
                    valign: fa_bottom
                };
            }
        }
        
        //key ring
        {
            _footer_x += _invSlotW + _invGap;
            var _key_x1 = _footer_x;
            var _key_y1 = _invY;
            draw_sprite_stretched_ext(spr_keyring, 0, _footer_x, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
            _footer_x += _invSlotW + _invGap;
            var _keys_count = obj_player.key_ring.count();
            draw_textbox(_footer_x, _invY+_invGap, _invSlotW-2*_invGap, _invSlotH-2*_invGap, $"x{_keys_count}");
            if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _key_x1, _key_y1, _footer_x+_invSlotW-2*_invGap, _invY+_invSlotH-2*_invGap)) {
                _do_draw_hint = true;
                _draw_hint_data = {
                    hint_x : mouse_gui_x,
                    hint_y : mouse_gui_y,
                    hint : _keys_count==0?keyring_hint:obj_player.key_ring.hint(),
                    halign : fa_right,
                    valign: fa_bottom
                };
            }
        }
        
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX + _invGap + (_invGap + _invSlotW), _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX + _invGap + (_invGap + _invSlotW)*2, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX + _invGap + (_invGap + _invSlotW)*3, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX + _invGap + (_invGap + _invSlotW)*4, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
        
       
        if (_hint_data != undefined) {
            _do_draw_hint = true;
            _draw_hint_data = _hint_data;
        }
    }
    
    
    if (_do_draw_hint) { 
        //show_debug_message($"_hint_data={_hint_data}, _do_draw_hint={_do_draw_hint}, hint={_draw_hint_data.hint}");
        draw_textbox_background(_draw_hint_data.hint_x, _draw_hint_data.hint_y, 64, 64, _draw_hint_data.hint, new BackgroundData(spr_hint_back, 0, 8), _draw_hint_data.halign, _draw_hint_data.valign, undefined, 0.6);
    }
    
    if (mouse_check_button_released(mb_left)) {
        _draggingItem = false;
        _dragSlotFromInventory = undefined;
        _dragSlotFromEquipment = undefined;
    }
} 