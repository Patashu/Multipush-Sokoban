///try_move(thing, dir, strength)

//0 for east, 1 for north, 2 for west, 3 for south
var thing = argument0;
var dir = argument1;
var strength = argument2;

global.info_message = "";

var pushees_list = ds_list_create();
var result = try_move_core(thing, dir, strength, pushees_list);
if (result == "wall")
{
	global.info_message = "Cannot move " + global.direction_name[dir] + ": A wall is in the way";
}
else if (result == "heavy")
{
	global.info_message = "Cannot move " + global.direction_name[dir] + ": You can only push at most " + string(strength) + "kg";	
}
else
{
	var dirxy = global.direction2[dir];
	var dx = dirxy[0]*TILE_SIZE;
	var dy = dirxy[1]*TILE_SIZE;
	
	thing.x += dx;
	thing.y += dy;
	for (var i = 0; i < ds_list_size(pushees_list); ++i)
	{
		pushees_list[| i].x += dx;
		pushees_list[| i].y += dy;
	}
	update_buttons();
}

ds_list_destroy(pushees_list);
return;