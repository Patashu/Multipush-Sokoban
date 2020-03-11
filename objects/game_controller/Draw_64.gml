draw_set_color(c_white);
draw_set_font(font0);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(16, room_height-16, global.info_message);

if (instance_exists(player_object))
{
	draw_text(16, 16, "Turn: " + string(global.turn_count));
}