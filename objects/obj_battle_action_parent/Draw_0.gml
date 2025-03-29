draw_self();

//draw_set_alpha(image_alpha);
if (cost_type == "None") {
    
} else if (cost_type == "AttackCharge") {
    draw_circle_color(x+2, y+2, 5, Color_AttackCharge, Color_AttackCharge, false);
    draw_textbox(x+2.5,y+2.5, 8, 8, string_format(cost_amount, 1, 1), fa_center, fa_middle);
} else if (cost_type == "UtilityCharge") {
    draw_circle_color(x+2, y+2, 5, Color_UtilityCharge, Color_UtilityCharge, false);
    draw_textbox(x+2.5,y+2.5, 8, 8, string_format(cost_amount, 1, 1), fa_center, fa_middle);
} else if (cost_type == "AttackAndUtilityCharge") {
    //draw_circle_color(x+2, y+2, 5, Color_AttackCharge, Color_AttackCharge, false);
    var _defColor = draw_get_color();
    draw_set_color(Color_AttackCharge);
    draw_pie(x-3, y-3, x+7, y+7, x+2, y-3, x+2, y+7, false);
    draw_set_color(Color_UtilityCharge);
    draw_pie(x-3, y-3, x+7, y+7, x+2, y+7, x+2, y-3, false);
    draw_textbox(x+2.5,y+2.5, 8, 8, string_format(cost_amount, 1, 1), fa_center, fa_middle);
    
    draw_set_color(_defColor);
}


