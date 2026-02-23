scores = get_highscores();

scr_list_quicksort = function(_list, _left, _right, _ascending)
{
    var i = _left;
    var j = _right;
    var pivot = _list[| (_left + _right) div 2].hscore;

    while (i <= j)
    {
        if (_ascending)
        {
            while (_list[| i].hscore < pivot) i++;
            while (_list[| j].hscore > pivot) j--;
        }
        else
        {
            while (_list[| i].hscore > pivot) i++;
            while (_list[| j].hscore < pivot) j--;
        }

        if (i <= j)
        {
            var temp = _list[| i];
            _list[| i] = _list[| j];
            _list[| j] = temp;

            i++;
            j--;
        }
    }

    if (_left < j)
        scr_list_quicksort(_list, _left, j, _ascending);

    if (i < _right)
        scr_list_quicksort(_list, i, _right, _ascending);
}

scr_list_quicksort(scores, 0, ds_list_size(scores) - 1, false);