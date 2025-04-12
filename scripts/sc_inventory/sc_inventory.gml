
enum InventorySlots { Slot1, Slot2, Slot3, Slot4, Slot5 };

enum EquipSlot { Armor, Helmet, Ring, Weapon };


function RDObject(_id, _uniq = false, _enab = true) constructor {
    
    id = _id;
    enabled = _enab;
    weight = 1;
    unique = _uniq;
    
    function toString() {
        return $"id={id} w={weight} uniq={unique}";
    }
    
    function create_instance(_x, _y, _layer) {}
    
}

function RDNull() : RDObject("Null", false, true) constructor {}

function RDTable() constructor {
    
    list = ds_list_create();
    uniques_rolled = ds_list_create();
    
    function add_entry(_weight, _entry) {
    _entry.weight = _weight;
        ds_list_add(list, _entry);
    }
    
    function reset() {
        ds_list_destroy(uniques_rolled);
        uniques_rolled = ds_list_create();
    }
    
    function roll(_count) {
        var _result = array_create(_count, new RDNull());
        var _ri = 0;
        
        var _sumWeight = 0;
        for (var _i = 0; _i < ds_list_size(list); _i++)
        {
            if (!list[|_i].enabled) {
                continue;
            }
            if (list[|_i].unique) {
                var _pos = ds_list_find_index(uniques_rolled, list[|_i]);
                if (_pos >= 0) {
                    continue;
                }
            }
            
            _sumWeight += list[|_i].weight;
        }
        
        for (var _c = 0; _c < _count; _c++) {
            var _rand = random_range(0, _sumWeight);
            show_debug_message($"Rolled {_rand} (0-{_sumWeight}) for {_c+1}/{_count}");
            var _currW = 0;
            for (var _i = 0; _i < ds_list_size(list); _i++)
            {
                if (!list[|_i].enabled) {
                    continue;
                }
                if (list[|_i].unique) {
                    var _pos = ds_list_find_index(uniques_rolled, list[|_i]);
                    if (_pos >= 0) {
                        continue;
                    }
                }
                
                _currW += list[|_i].weight;
                
                if (_currW > _rand) {
                    //roll this
                    show_debug_message($"Hit: {list[|_i]}");
                    _result[_ri] = list[|_i];
                    _ri++;
                    if (list[|_i].unique) {
                        ds_list_add(uniques_rolled, list[|_i]);
                        _sumWeight -= list[|_i].weight;
                    }
                    break;
                }
            }
        }
        
        return _result;
    }
    
}

function CoinDrop(_amount = 1) : RDObject("Coin", false, true) constructor {
    
    amount = _amount;
    
    function create_instance(_x, _y, _layer) {
        instance_create_layer(_x, _y, _layer, obj_item_coin, {
            coin_amount: amount
        });
    }
}

/**
 * Item drop type for loottable
 * @param {Asset.GMObject} _obj Object to spawn
 * @param {Struct} _struct Data to pass to newly created item
 * @param {bool} _uniq Is the item unique (cannot spawn more than 1.
 * @param {bool} [_enab]=true Is drop enabled
 */
function ItemDrop(_obj, _struct, _uniq, _enab = true) : RDObject("Item", _uniq, _enab) constructor {
    
    object_index = _obj;
    object_data = _struct;
    
    function create_instance(_x, _y, _layer) {
        instance_create_layer(_x, _y, _layer, object_index, object_data);
    }
}





