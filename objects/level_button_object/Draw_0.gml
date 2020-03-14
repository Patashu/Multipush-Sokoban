draw_self();

draw_set_color((image_index mod 2) == 1 ? c_black : c_white);
draw_set_font(font0);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_text(X_MIDDLE, Y_MIDDLE,
global.room_names[? destination] != undefined ? global.room_names[? destination] : room_get_name(destination));