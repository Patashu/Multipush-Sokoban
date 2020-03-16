///do_undo()

enum undo_type
{
	turn_count,
	update,
	major_change
}

global.info_message = "";

if (ds_list_size(global.undo_buffer) == 0)
{
	global.info_message = "Nothing to undo!";
	return;
}

for (var i = ds_list_size(global.undo_buffer)-1; i >= 0; --i)
{
	var undo = global.undo_buffer[| i];
	ds_list_delete(global.undo_buffer, i);
	
	if (undo[0] == undo_type.turn_count)
	{
		global.turn_count = undo[1];
		return;
	}
	else if (undo[0] == undo_type.update)
	{
		var thing = undo[1];
		thing.x = undo[2];
		thing.y = undo[3];
		var dir = undo[4];
		do_dir_change(thing, dir);
		update_buttons();
	}
	else if (undo[0] == undo_type.major_change)
	{
		if (UNLIMITED_UNDO or global.major_change)
		{
			global.major_change = false;	
		}
		else
		{
			global.info_message = "You can only undo past one major change!";
			ds_list_add(global.undo_buffer, undo);
			return;
		}
	}
}