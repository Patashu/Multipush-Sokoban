///do_dir_change(thing, dir)

var thing = argument0;
var dir = argument1;

if (thing.object_index == player_object)
{
	thing.dir = dir;
	thing.frames_since_dir_change = 0;
	thing.idle_animation_state = 0;
	thing.next_animation_delay = irandom_range(300, 600);
	if (dir == -1)
	{
		thing.image_index = 0;
	}
	else
	{
		var indices =  [6,5,4,1];
		thing.image_index = indices[dir];	
	}
}
//nothing else has a dir and probably won't ever??