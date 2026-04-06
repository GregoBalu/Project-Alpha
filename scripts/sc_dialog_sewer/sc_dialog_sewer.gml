function initDialogSewer(){
    initDialog();
}


global.dialog_hint_fuel_fill = [
    new dialog_entry("Fuel filler", c_lime, spr_fuel_filler, new dialog_text(getText("Dialog_s_fuel1")) ),
    new dialog_entry("Fuel container", c_lime, spr_fuel_container, new dialog_text(getText("Dialog_s_fuel2")) )
]