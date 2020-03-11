///try_move(thing, dir, strength, is_safe, is_run)

//0 for east, 1 for north, 2 for west, 3 for south
var thing = argument0;
var dir = argument1;
var strength = argument2;
var is_safe = argument3;
var is_run = argument4;

global.info_message = "";

var should_repeat = false;

var pushees_list = ds_list_create();
do
{
	should_repeat = false;
	var result = try_move_core(thing, dir, strength, pushees_list, is_safe, is_run);
	if (result == "wall")
	{
		global.info_message = "Cannot move " + global.direction_name[dir] + ": A wall is in the way";
	}
	else if (result == "heavy")
	{
		global.info_message = "Cannot move " + global.direction_name[dir] + ": You can only push at most " + string(strength) + "kg";	
	}
	else if (result == "unsafe")
	{
		//nothing	
	}
	else
	{
		//successfully made a move
		ds_list_add(global.undo_buffer, [undo_type.turn_count, global.turn_count]);
		global.turn_count++;
		
		var dirxy = global.direction2[dir];
		var dx = dirxy[0]*TILE_SIZE;
		var dy = dirxy[1]*TILE_SIZE;
		
		ds_list_add(global.undo_buffer, [undo_type.update, thing.id, thing.x, thing.y]);
		thing.x += dx;
		thing.y += dy;
		for (var i = 0; i < ds_list_size(pushees_list); ++i)
		{
			global.major_change = true;
			var pushee = pushees_list[| i];
			ds_list_add(global.undo_buffer, [undo_type.update, pushee.id, pushee.x, pushee.y]);
			pushee.x += dx;
			pushee.y += dy;
		}
		if (ds_list_size(pushees_list) > 0)
		{
			ds_list_add(global.undo_buffer, [undo_type.major_change, false]);
		}
		update_buttons();
		if (is_run)
		{
			should_repeat = true;
			
			//set should_repeat UNLESS (there is floor to our left/right AND there used to be an obstacle to our left/right)
			var dirxyleft = global.direction2[(dir + 3) mod 4];
			var dirxyright = global.direction2[(dir + 1) mod 4];
			var dxleft = dirxyleft[0]*TILE_SIZE;
			var dyleft = dirxyleft[1]*TILE_SIZE;
			var dxright = dirxyright[0]*TILE_SIZE;
			var dyright = dirxyright[1]*TILE_SIZE;
			
			if (is_empty_floor(thing.x+dxleft, thing.y+dyleft) and !is_empty_floor(thing.x-dx+dxleft, thing.y-dy+dyleft))
			{
				should_repeat = false;
			}
			else if (is_empty_floor(thing.x+dxright, thing.y+dyright) and !is_empty_floor(thing.x-dx+dxright, thing.y-dy+dyright))
			{
				should_repeat = false;
			}
		}
	}
} until (!should_repeat);

ds_list_destroy(pushees_list);
return;