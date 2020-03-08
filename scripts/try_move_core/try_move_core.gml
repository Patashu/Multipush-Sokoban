///try_move_core(thing, dir, strength, pushees_list)

//0 for east, 1 for north, 2 for west, 3 for south
var thing = argument0;
var dir = argument1;
var strength = argument2;
var pushees_list = argument3;

var dirxy = global.direction2[dir];
	var dx = dirxy[0]*TILE_SIZE;
	var dy = dirxy[1]*TILE_SIZE;
var xx = thing.x + dx;
var yy = thing.y + dy;
if (!collision_point(xx, yy, floor_object, false, false))
{
	return "wall";
}
else
{
	var block = collision_point(xx, yy, block_object, false, false);
	if (block != noone)
	{
		ds_list_add(pushees_list, block);
		strength -= block.weight;
		if (strength < 0)
		{
			return "heavy";
		}
		return try_move_core(block, dir, strength, pushees_list);
	}
	else
	{
		return true;
	}
}