initInput();

MouseHoldAlarm = 1;

//stock = [];

vendor_w = 320;
vendor_h = 180;

stock_index = 0;

DO_DIALOG = true;

dialog = noone;

show_gold_change = false;
gold_change_value = 42;
gold_change_x = 130;//105
gold_change_y = 117;//81;
gold_change_tick = 0;

MaxMouseHoldAlarm = 0.5*TIME_SECOND;
was_in_hold = false;
in_hold = false;
hold_region = {
    x1: 0,
    y1: 0,
    x2: 0,
    y2: 0
};
hold_action = {
    func: function(_cont) {},
    context: undefined
};
is_short_hold = false;

close = function() {
    if (dialog != noone) {
        instance_destroy(dialog);
    }
    instance_destroy();
}

dialog_closed = function() {
    dialog = noone;
}

buy = function(_i) {
    if (stock[_i].onClick()) {
        showGoldChange(-stock[_i].price);
    }
}

sell = function(_slot) {
    // SELLLLLL
    var _max_price = 6;
    var _vx = random_range(0, 0.9);
    var _price = round( -_max_price*(_vx*_vx)+_max_price );  // max_price - 1
    //show_debug_message($"Sold {_item.name} for {_price}");
    var _inventoryItem = obj_player.removeFromInventory(_slot);
    if (_inventoryItem != noone) {
        obj_player.coins += _price;
        showGoldChange(_price);
        //TODO: animation
        audio_play_sound(snd_coin_drop, 4, false, 1, 0, random_range(0.9, 1.1));
        instance_destroy(_inventoryItem);
    }
}

showGoldChange = function(_amt) {
    gold_change_tick = 2*TIME_SECOND;
    gold_change_x = 130;
    gold_change_y = 117;
    gold_change_value = _amt;
    if (_amt < 0) {
        gold_change_y -= 10;
    }
    show_gold_change = true;
}

startHold = function(_x1, _y1, _x2, _y2, _func, _cont) {
    show_debug_message($"Hold Started");
    in_hold = true;
    alarm[MouseHoldAlarm] = MaxMouseHoldAlarm;
    hold_region.x1 = _x1;
    hold_region.y1 = _y1;
    hold_region.x2 = _x2;
    hold_region.y2 = _y2;
    hold_action.func = _func
    hold_action.context = _cont;
}

stopHold = function() {
    if (MaxMouseHoldAlarm - alarm[MouseHoldAlarm] < 0.1*TIME_SECOND) {
        is_short_hold = true;
    } else {
        is_short_hold = false;
    }
    in_hold = false;
    alarm[MouseHoldAlarm] = 0;
    show_debug_message("Hold Stopped!");
}
