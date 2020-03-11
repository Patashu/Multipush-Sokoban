///do_undo()

enum undo_type
{
	turn_count,
	update
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
	}
}