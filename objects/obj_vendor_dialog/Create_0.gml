vendor_w = 320;
vendor_h = 180;


cancel_subimg = 0;
accept_subimg = 0;


accept = function() {
    accept_func();
    parent.dialog_closed();
    instance_destroy();
}

cancel = function() {
    cancel_func();
    parent.dialog_closed();
    instance_destroy();
}
