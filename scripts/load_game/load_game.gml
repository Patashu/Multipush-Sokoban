///load_game(filename)

var filename = argument0;

//do this first as well, in case there's no save file
initialize_game_data();

if (!file_exists(filename)) { return; }

var save_file_text = "";
var file = file_text_open_read(filename);
while (!file_text_eof(file))
{
	save_file_text += file_text_readln(file);	
}
file_text_close(file);

if (variable_global_exists("game_data") and ds_exists(global.game_data, ds_type_map))
{
	ds_map_destroy(global.game_data);
}

global.game_data = json_decode(save_file_text);

var globals = global.game_data[? "globals"];
var size = ds_map_size(globals);
var key = ds_map_find_first(globals);
for (var i = 0; i < size; ++i)
{
	variable_global_set(key, globals[? key]);
	key = ds_map_find_next(globals, key);
}

//do this last
initialize_game_data();