var _orig_w = display_get_gui_width();
var _orig_h = display_get_gui_height();

display_set_gui_size(vendor_w, vendor_h);

draw_sprite_stretched(spr_vendor_back, 0, 0, 0, vendor_w, vendor_h)

draw_textbox(159, 19, 80, 32, $"Shop: {global.dialog_vendor_name}", fa_center, fa_middle);

{ // ***** Inventory *****
    drawInventory = function(_slot, _x, _y) {
    
        if (ds_map_exists(obj_player.inventory, _slot) ) {
            var _item = obj_player.inventory[?_slot];
            draw_sprite_stretched(_item.sprite_index, _item.image_index, _x, _y, 20, 20);
            if (dialog == noone) {
                var _subimg = 0;
                if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _x, _y, _x + 19, _y + 19)) {
                    _subimg = 1;
                    //show_debug_message($"released={mouse_check_button_released(mb_left)} in_hold={in_hold} alarmdiff={(MaxMouseHoldAlarm - alarm[MouseHoldAlarm])} treshold={0.2*TIME_SECOND}");
                    if (mouse_check_button_pressed(mb_left)) {
                        startHold(_x, _y, _x+19, _y+19, sell, _slot);
                    } else if (mouse_check_button_released(mb_left) && ( (was_in_hold && is_short_hold ) || (!in_hold && !was_in_hold) ) ) {
                        stopHold();
                        if (DO_DIALOG) {
                            dialog = instance_create_depth(0, 0, depth-1, obj_vendor_dialog, {
                                dialog_text: string($"Sell item ({_item.name})?"),
                                accept_func: function() {
                                    parent.sell(data.slot);
                                },
                                cancel_func: function() {},
                                parent: id,
                                data: {
                                    slot: _slot
                                }
                            });
                        } else {
                            sell(_slot);
                        }
                    }
                } else {
                    
                }
                
                if (_subimg == 1) {
                    draw_sprite(spr_vendor_sell_highlighted, 0, _x, _y);
                }
                }
        } else {
            draw_sprite_ext(spr_vendor_sell_highlighted, 0, _x, _y, 1, 1, 0, c_black, 1);
        }
    }
    
    drawInventory(InventorySlots.Slot1, 22, 40);
    drawInventory(InventorySlots.Slot2, 47, 40);
    drawInventory(InventorySlots.Slot3, 72, 40);
    drawInventory(InventorySlots.Slot4, 97, 40);
    drawInventory(InventorySlots.Slot5, 122, 40);

}

// ***** list gold, other useful stats *****

draw_textbox(15, 81, 60, 12, $"Gold: {obj_player.coins}");
draw_textbox(15, 96, 60, 12, $"Corruption: {obj_player.corruption}");

draw_sprite(spr_no_refund, 0, 80, 110);

draw_textbox(23, 140, 60, 12, $"Health: {obj_player.hp} / {obj_player.hp_total}");

if (show_gold_change) {

    draw_textbox_color(gold_change_x, gold_change_y, 16, 16, $"{gold_change_value>=0?"+":""}{gold_change_value}g", (gold_change_value>=0)?c_green:c_red, fa_right);
    draw_sprite_stretched(spr_coin, 0, gold_change_x, gold_change_y, 16, 16);
}


{ // ***** Buy stock tab *****
    var _buy_x = 166;
    var _buy_y = 40;
    
    var _len = array_length(stock);
    for (var _i = 0; _i < _len; ++_i)
    {
        var _item = stock[_i];
        var _clickable = _item.condition();
        
        //166, 40 -> 309, 62
        draw_sprite(spr_vendor_buy_back, 0, _buy_x, _buy_y);
        
        draw_sprite_stretched(_item.spr, 0, 171, _buy_y + 5, 13, 13);
        draw_textbox(185, _buy_y + 12, 90, 13, _item.name, fa_left, fa_middle);
        //draw_textbox(266, 45, 10, 13, $"(x{_item.stock})");
        
        //if (_clickable) {
            draw_textbox(304, _buy_y + 12, 29, 13, $"{_item.price}g", fa_right, fa_middle);
        /*} else {
            draw_textbox(304, _buy_y + 12, 29, 13, "?g", fa_right, fa_middle);
        }*/
        
        
        if (_clickable) {
            if (dialog == noone) {
                var _subimg = 0;
                if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _buy_x, _buy_y, 309, _buy_y + 22)) {
                    _subimg = 1;
                    
                    if (mouse_check_button_pressed(mb_left)) {
                        startHold(_buy_x, _buy_y, 309, _buy_y + 22, buy, _i);
                    } else if (mouse_check_button_released(mb_left) && ( (in_hold && is_short_hold ) || (!in_hold && !was_in_hold) ) ) {
                        stopHold();
                        if (DO_DIALOG) {
                            dialog = instance_create_depth(0, 0, depth-1, obj_vendor_dialog, {
                                dialog_text: string($"Buy item ({_item.name}) for {_item.price}g?"),
                                accept_func: function() {
                                    parent.buy(data.ind);
                                },
                                cancel_func: function() {},
                                parent: id,
                                data: {
                                    ind: _i
                                }
                            });
                        } else {
                            buy(_i);
                        }
                    }
                }
                
                if (_subimg == 1) {
                    draw_sprite(spr_vendor_buy_item_highlighted, 0, _buy_x, _buy_y);
                }
            }
        } else {
            draw_sprite(spr_vendor_buy_item_shaded, 0, _buy_x, _buy_y);
            if (_item.stock <= 0) {
                draw_sprite(spr_vendor_buy_item_oos, 0, _buy_x, _buy_y);
            }
        }
        
        _buy_y += 25;
    }
}


{ // ***** Back button *****
    var _subimg = 0;
    if (dialog == noone) {
        if (point_in_rectangle(mouse_gui_x, mouse_gui_y, 147, 153, 171, 178)) {
            _subimg = 1;
            if (mouse_check_button(mb_left)) {
                _subimg = 2;
            } else if (mouse_check_button_released(mb_left)) {
                close();
            }
        }
    }
    
    draw_sprite(spr_vendor_back_button, _subimg, 147, 153);
}

if (in_hold) {
    //show_debug_message($"point_in_rectangle({mouse_gui_x}, {mouse_gui_y}, {hold_region.x1}, {hold_region.y1}, {hold_region.x2}, {hold_region.y2})");
    if (!point_in_rectangle(mouse_gui_x, mouse_gui_y, hold_region.x1, hold_region.y1, hold_region.x2, hold_region.y2)) {
        show_debug_message("Hold interrupted!");
        in_hold = false;
        alarm[MouseHoldAlarm] = 0;
    } else {
        //good
        var _progress_subimg = (1 -( alarm[MouseHoldAlarm] / MaxMouseHoldAlarm)) * 10;
        draw_sprite(spr_progress_circle, _progress_subimg, mouse_gui_x, mouse_gui_y);
    }
}

display_set_gui_size(_orig_w, _orig_h);