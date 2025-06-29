
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
        draw_textbox(160, _y + 4, 60, 20, "Player Sheet", fa_center);
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
        draw_textbox(_x + 32, _y + 18, 42, 6, string("Health: {0} / {1}", obj_player.hp, obj_player.hp_total), fa_center);
        draw_progress_bar(_x + 8, _y + 24, 48, 6, _hp_percent, _hp_color);
    }
    _yshift += 30;
    if (opening_state-32 > (_x+8+48)) {
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, string("Attack charge"), fa_center);
        draw_progress_bar(_x + 8, _y + _yshift + 12, 48, 6, (obj_player.charge_attack/obj_player.charge_attack_total), Color_AttackCharge);
    }
    _yshift += 12;
    if (opening_state-32 > (_x+8+48)) {
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, string("Utility charge"), fa_center);
        draw_progress_bar(_x + 8, _y + _yshift + 12, 48, 6, (obj_player.charge_util/obj_player.charge_util_total), Color_UtilityCharge);
    }
    
    
    _yshift += 18;
    if (opening_state-32 > (_x+8+48)) {
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, string("Level: {0}", obj_player.level), fa_center);
        _yshift += 6;
        var _xp_percent = (obj_player.xp/obj_player.xp_total);
        draw_textbox(_x + 32, _y + _yshift + 6, 42, 6, string("XP: {0} / {1}", obj_player.xp, obj_player.xp_total), fa_center);
        draw_progress_bar(_x + 8, _y + _yshift + 12, 48, 6, _xp_percent, Color_XP);
    }
    
    _yshift += 22;
    if (opening_state-32 > (_x+8+48)) {
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, string("Damage: {0}", obj_player.damage));
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, string("Move speed: {0}", obj_player.move_speed));
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, string("Defense: {0}", obj_player.defense));
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, string("Crit chance: {0}%", obj_player.crit_chance*100));
        _yshift += 6;
        draw_textbox(_x+10, _y + _yshift, 46, 6, string("Lifesteal: {0}%", obj_player.lifesteal*100));
        _yshift += 6;
    }
    
    
    
    
    
    
    if (opening_state-32 > (_x + 64 + 2) ) {
        //divider
        draw_line_width_color(_x + 64, _y + 16, _x + 64, _y + _height - 16, 2, c_black, c_black);
    }
    
    if (opening_state-32 > (_x + 72 + 64) ) {
        draw_textbox(_x + 72, _y + 18, 64, 8, string("Available talent points: {0}", obj_player.talent_points));
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
        
        draw_textbox(_row + _talentWidth/2, _col+_talentHeight, _talentWidth+_gapX/2, _gapY, _list[|_i].name, fa_center);
        
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
    
    
    if (opening_state-32 > (_x + _talentSectionEndX + 8 + 64) ) {
        var _invX = _x + _talentSectionEndX + 8;
        var _invY = _y + 24;
        var _invGap = 4;
        
        var _invSlotW = 24;
        var _invSlotH = 24;
        
        draw_sprite_stretched_ext(spr_human_mesh, 0, _invX, _invY-4, _invSlotW*4, _invSlotH*4, c_gray, 0.75);
        
        function drawArmorSlot(_slot, _x, _y, _w, _h, _margin) {
            draw_sprite_stretched_ext(spr_gui_slot, 0, _x, _y , _w, _h, #C0C0C0, 1);
            if (ds_map_exists(obj_player.equipped_items, _slot) ) {
                //show_debug_message($"Draw {_slot} slot");
                draw_sprite_stretched(obj_player.equipped_items[?_slot].sprite_index, 
                        obj_player.equipped_items[?_slot].image_index, 
                        _x + _margin, _y + _margin, _w -(2*_margin), _h-(2*_margin));
                if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_w, _y+_h)) {
                    if (mouse_check_button_pressed(mb_right)) {
                        obj_player.unequipItem(_slot);
                        return undefined;
                    }
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
        var _hint_data = {};
        _hint_data = drawArmorSlot(EquipSlot.Helmet, _invX+_invSlotW*1.5, _invY, _invSlotW, _invSlotH, 2);
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX+_invSlotW*1.5, _invY, _invSlotW, _invSlotH, #C0C0C0, 1);
    
        _hint_data = drawArmorSlot(EquipSlot.Armor, _invX+_invSlotW*1.5, _invY+(_invSlotW+_invGap)*2, _invSlotW, _invSlotH, 2) ?? _hint_data;
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX+_invSlotW*1.5, _invY+(_invSlotW+_invGap)*2, _invSlotW, _invSlotH, #C0C0C0, 1);
        
        _invY+=(_invGap+_invSlotH)*2;
        _hint_data = drawArmorSlot(EquipSlot.Ring, _invX, _invY, _invSlotW, _invSlotH, 2) ?? _hint_data;
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX, _invY, _invSlotW, _invSlotH, #C0C0C0, 1);
        _hint_data = drawArmorSlot(EquipSlot.Weapon, _invX + (_invSlotW)*3, _invY, _invSlotW, _invSlotH, 2) ?? _hint_data;
        //draw_sprite_stretched_ext(spr_gui_slot, 0, _invX + (_invSlotW)*3, _invY, _invSlotW, _invSlotH, #C0C0C0, 1);
        
        _invY += _invSlotH + _invSlotH + _invGap;
        _invSlotW = 16;
        _invSlotH = 16;
        _invGap = 2;
        var _invItemMargin = 2;
        
        function drawInventorySlot(_slot, _x, _y, _w, _h, _margin) {
            draw_sprite_stretched_ext(spr_gui_slot, 0, _x, _y , _w, _h, #C0C0C0, 1);
            if (ds_map_exists(obj_player.inventory, _slot) ) {
                //show_debug_message($"Draw {_slot} slot");
                draw_sprite_stretched(obj_player.inventory[?_slot].sprite_index, 
                        obj_player.inventory[?_slot].image_index, 
                        _x + _margin, _y + _margin, _w -(2*_margin), _h-(2*_margin));
                if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x+_w, _y+_h)) {
                    if (mouse_check_button_pressed(mb_right)) {
                        obj_player.equipItem(_slot);
                        return undefined;
                    }
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
        
        _hint_data = drawInventorySlot(InventorySlots.Slot1, _invX + _invGap, _invY, _invSlotW, _invSlotH, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot2, _invX + _invGap+(_invGap + _invSlotW), _invY, _invSlotW, _invSlotH, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot3, _invX + _invGap+(_invGap + _invSlotW)*2, _invY, _invSlotW, _invSlotH, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot4, _invX + _invGap+(_invGap + _invSlotW)*3, _invY, _invSlotW, _invSlotH, _invItemMargin) ?? _hint_data;
        _hint_data = drawInventorySlot(InventorySlots.Slot5, _invX + _invGap+(_invGap + _invSlotW)*4, _invY, _invSlotW, _invSlotH, _invItemMargin) ?? _hint_data;
        _invY += _invSlotH + _invGap;
        draw_sprite_stretched_ext(spr_coin, 0, _invX + _invGap, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
        var _footer_x = _invX + _invGap + _invSlotW + _invGap+_invGap;
        draw_textbox(_footer_x, _invY+_invGap, _invSlotW-2*_invGap, _invSlotH-2*_invGap, $"x{obj_player.coins}");
        
        _footer_x += _invSlotW + _invSlotW + _invGap*2;
        var _key_x1 = _footer_x;
        var _key_y1 = _invY;
        draw_sprite_stretched_ext(spr_keyring, 0, _footer_x, _invY , _invSlotW, _invSlotH, #C0C0C0, 1);
        _footer_x += _invSlotW + _invGap;
        draw_textbox(_footer_x, _invY+_invGap, _invSlotW-2*_invGap, _invSlotH-2*_invGap, $"x{obj_player.key_ring.count()}");
        if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _key_x1, _key_y1, _footer_x+_invSlotW-2*_invGap, _invY+_invSlotH-2*_invGap)) {
            _do_draw_hint = true;
            _draw_hint_data = {
                hint_x : mouse_gui_x,
                hint_y : mouse_gui_y,
                hint : obj_player.key_ring.hint(),
                halign : fa_right,
                valign: fa_bottom
            };
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
        draw_textbox_background(_draw_hint_data.hint_x, _draw_hint_data.hint_y, 64, 64, _draw_hint_data.hint, new BackgroundData(spr_hint_back, 0, 8), _draw_hint_data.halign, _draw_hint_data.valign);
    }
} 