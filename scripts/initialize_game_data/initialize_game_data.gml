///initialize_game_data()

if (!variable_global_exists("game_data")
or global.game_data == undefined or global.game_data == noone
or !ds_exists(global.game_data, ds_type_map)) { global.game_data = ds_map_create(); }

if (global.game_data[? "globals"] == undefined)
{
	var globals = ds_map_create();
	ds_map_add_map(global.game_data, "globals", globals);
}

if (global.game_data[? "beaten"] == undefined)
{
	var beaten = ds_map_create();
	ds_map_add_map(global.game_data, "beaten", beaten);
}