function initDialogSewer(){
    initDialog();
}


global.dialog_hint_fuel_fill = [
    new dialog_entry("Fuel filler", c_lime, spr_fuel_filler, new dialog_text("This is a fuel filling station. It can fill a container with fuel. Fuel is useful for a handful of machines.") ),
    new dialog_entry("Fuel container", c_lime, spr_fuel_container, new dialog_text("This container is a bit wrecked, it has holes and cracks. It can barely hold anything. You need to be quick transporting anything in this.") )
]