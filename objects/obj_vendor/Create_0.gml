initInput();


//stock = [];

vendor_w = 320;
vendor_h = 180;

stock_index = 0;

dialog = noone;


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
    stock[_i].onClick();
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
        //TODO: animation
        audio_play_sound(snd_coin_drop, 4, false, 1, 0, random_range(0.9, 1.1));
        instance_destroy(_inventoryItem);
    }
}