

/// @desc Draw a text into a textbox that autosclaes the text.
/// @param {Real} _anchor_x Anchor point X coordinate of the textbox
/// @param {Real} _anchor_y Anchor point Y coordinate of the textbox.
/// @param {Real} _box_width The width of the textbox.
/// @param {Real} _box_height The height of the textbox.
/// @param {String} _text The text to draw.
/// @param {Constant.HAlign} _halign Horizontal alignment of textbox
/// @param {Constant.VAlign} _valign Vertical alignment of the textbox
/// @param {Bool} _debug Whether to draw the debug bounding lines of the textbox or not. Default off.
function draw_textbox(_anchor_x, _anchor_y, _box_width, _box_height, _text, _halign = fa_left, _valign = fa_top, _debug = false){
    draw_textbox_background(_anchor_x, _anchor_y, _box_width, _box_height, _text, undefined, _halign, _valign, _debug);
}

function draw_textbox_color(_anchor_x, _anchor_y, _box_width, _box_height, _text, _color, _halign = fa_left, _valign = fa_top, _debug = false){
    draw_textbox_background_color(_anchor_x, _anchor_y, _box_width, _box_height, _text, undefined, _color, _halign, _valign, _debug);
}

function BackgroundData(_sprite, _sindex, _margin) constructor {
    sprite = _sprite;
    image_index = _sindex;
    margin = _margin;
}

function draw_textbox_background(_anchor_x, _anchor_y, _box_width, _box_height, _text, _background_data, _halign = fa_left, _valign = fa_top, _debug = false) {
    draw_textbox_background_color(_anchor_x, _anchor_y, _box_width, _box_height, _text, _background_data, c_black, _halign, _valign, _debug);
}
    
function draw_textbox_background_color(_anchor_x, _anchor_y, _box_width, _box_height, _text, _background_data, _color, _halign = fa_left, _valign = fa_top, _debug = false) {
    draw_set_halign(_halign);
    draw_set_valign(_valign);
    
    if (draw_get_font() == noone) {
        draw_set_font(font_base);
    }
    
    var text_width = string_width(_text);
    var text_height = string_height(_text);

    
    //var text_width_scale = clamp(_box_width/text_width, 0.2, 1.0);
    var text_width_scale = _box_width/text_width;
    /*if (_box_width < text_width) {
        text_width_scale = _box_width/text_width;
    }*/
    
    //var text_height_scale = clamp(_box_height/text_height, 0.2, 1.0);
    var text_height_scale = _box_height/text_height;
    /*if (_box_height < text_height) {
        text_height_scale = _box_height/text_height;
    }*/
    
    var _scale_width = 1;
    var _scale_height = 1;
    if (text_width_scale < text_height_scale) {
        _scale_width = text_width_scale;
        _scale_height = clamp(text_height_scale, 0.9*text_width_scale, 1.1*text_width_scale);
    } else {
        _scale_height = text_height_scale;
        _scale_width = clamp(text_width_scale, 0.9*text_height_scale, 1.1*text_height_scale);
    }
    
    var _actual_text_width = text_width*_scale_width;
    var _actual_text_height = text_height*_scale_height;
    
    var topLeft = new Vec2(_anchor_x, _anchor_y);
    if (_halign == fa_center) {
        topLeft.x -= _actual_text_width/2;
    } else if (_halign == fa_right) {
        topLeft.x -= _actual_text_width;
    }
    if (_valign == fa_middle) {
        topLeft.y -= _actual_text_height/2;
    } else if (_valign == fa_bottom) {
        topLeft.y -= _actual_text_height;
    }
    
    
    if (_debug) {
        draw_rectangle_color(topLeft.x, topLeft.y, topLeft.x + _actual_text_width-1, topLeft.y+_actual_text_height-1, c_ltgrey, c_ltgrey, c_ltgrey, c_ltgrey,true);
    }
    if (_background_data != undefined) {
        draw_sprite_stretched(_background_data.sprite, _background_data.image_index, topLeft.x - _background_data.margin, topLeft.y - _background_data.margin, 
                _actual_text_width+2*_background_data.margin, 
                _actual_text_height+2*_background_data.margin);
    }
    
    //if (text_width_scale <= 0.2) {
    //    draw_text_ext_transformed_color(_anchor_x, _anchor_y, _text, 1, _box_width, 0.2, 0.2, 0, _color, _color, _color, _color, 1);
    //} else {
        draw_text_transformed_color(_anchor_x, _anchor_y, _text, _scale_width, _scale_height, 0, _color, _color, _color, _color, 1);
    //}
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    delete topLeft;
}


/**
 *  Draws a progress bar.
 * @param {real} _anchor_x  Top left X coordinate of the progress bar
 * @param {real} _anchor_y  Top left Y coordinate of the progress bar
 * @param {real} _width  Width of the progress bar
 * @param {real} _height  Height of the progress bar
 * @param {real} _percent  Percent of the progress bar [0,1]
 * @param {constant.color} _color  Color of the progress bar
 */
function draw_progress_bar(_anchor_x, _anchor_y, _width, _height, _percent, _color) {
    draw_sprite_stretched(spr_box, 0, _anchor_x, _anchor_y, _width, _height);
    draw_sprite_stretched_ext(spr_box, 1, _anchor_x, _anchor_y, _width * _percent, _height, _color, 1);
}


/**
 * Draws a sector of an elliptical disc, mimicking draw_pie() from GM5.
 *  It also mimics draw_ellipse() from GM6 in that it will draw either as a
 *  solid or an outline, and it uses a primitive drawn at a limited resolution.
 *  The pie is a closed figure of an arc with two lines between the center
 *  and the starting and ending points. The arc is drawn following the perimeter
 *  of the ellipse, counterclockwise, from the starting point to the ending
 *  point. The starting point is the intersection of the ellipse and the line
 *  from the center to (x3,y3). Then ending point is the intersection of the 
 *  ellipse and the line form the center to (x4,y4).
 * @param {Real} x1 1st corner of bounding rectangle
 * @param {Real} y1 1st corner of bounding rectangle
 * @param {Real} x2 2nd corner of bounding rectangle
 * @param {Real} y2 2nd corner of bounding rectangle
 * @param {Real} x3 determines the start angle
 * @param {Real} y3 determines the start angle
 * @param {Real} x4 determines the end angle
 * @param {Real} y4 determines the end angle
 * @param {Bool} outline true to draw as an outline
 * @param {real} [precision]=24 number of segments a full ellipse would be drawn with, 
 *                              [4..64] divisible by 4, default 24, real (optional)
 */
function draw_pie(x1,y1,x2,y2,x3,y3,x4,y4,outline,precision = 24)
{
    if (precision == 0) precision = 24;
    var res,xm,ym,xr,yr,r,a1,a2,sx,sy,a;
    res = 360 / min(max(4,4*(precision div 4)),64);
    xm = (x1+x2)/2;
    ym = (y1+y2)/2;
    xr = abs(x2-x1)/2;
    yr = abs(y2-y1)/2;
    if (xr > 0) r = yr/xr;
    else r = 0;
    a1 = point_direction(0,0,(x3-xm)*r,y3-ym);
    a2 = point_direction(0,0,(x4-xm)*r,y4-ym);
    if (a2<a1) a2 += 360;
    if (outline) draw_primitive_begin(pr_linestrip);
    else draw_primitive_begin(pr_trianglefan);
    draw_vertex(xm,ym);
    sx = xm+lengthdir_x(xr,a1);
    sy = ym+lengthdir_y(yr,a1);
    draw_vertex(sx,sy);
    for (a=res*(a1 div res + 1); a<a2; a+=res) {
        sx = xm+lengthdir_x(xr,a);
        sy = ym+lengthdir_y(yr,a);
        draw_vertex(sx,sy);
    }
    sx = xm+lengthdir_x(xr,a2);
    sy = ym+lengthdir_y(yr,a2);
    draw_vertex(sx,sy);
    if (outline) draw_vertex(xm,ym);
    draw_primitive_end();
}

function draw_shadow() {
    var _xoffset = (-sprite_width/2)+1;
    //var _xoffset = (bbox_right - bbox_left)/2+1
    var _yoffset = (sprite_height/2)-7;
    //var _yoffset = (bbox_bottom - bbox_top)/2-1
    
    draw_sprite_stretched_ext(spr_shadow, 0, x+_xoffset, y+_yoffset, sprite_width-2, 8, c_white, 0.5);
    //draw_sprite_stretched_ext(spr_shadow, 0, bbox_left+1, bbox_bottom, sprite_width-2, 8, c_white, 0.5);
}




