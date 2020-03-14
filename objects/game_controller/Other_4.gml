ds_list_clear(global.undo_buffer);
global.turn_count = 0;
update_buttons();
if (instance_exists(player_object))
{
	global.escape_room = global.last_room;
	global.info_message = "Press Q/Esc to leave this puzzle."
}
else
{
	if (instance_exists(menu_button_object))
	{
		global.escape_room = menu_button_object.destination;
	}
	else
	{
		global.escape_room = starting_room;	
	}
	global.info_message = ""
}