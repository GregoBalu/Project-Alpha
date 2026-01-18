




function VendorItem(_text, _sprite, _price, _stock, _on_click_action) constructor {

    name = _text;
    spr = _sprite;
    price = _price;
    stock = _stock;
            
    
    _condAction = function() {
        return stock > 0 && obj_player.coins >= price;
    }
    function condition() {
        return _condAction();
    }
    
    _clickAction = _on_click_action;
    onClick = function() {
        if (!_clickAction()) {
            return false;
        }
        stock--;
        obj_player.coins -= price;
        audio_play_sound(snd_coin_drop, 5, false);
        return true;
    }
    
}