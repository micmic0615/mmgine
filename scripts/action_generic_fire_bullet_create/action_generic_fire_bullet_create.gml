var action_map_source = argument[0];
var argument_array = argument[1];

var action_map = ds_map_create();
ds_map_copy(action_map, action_map_source);

action_map[?"color"] = argument_array[0];

action_map[?"bullet_type"] = argument_array[1];
action_map[?"bullet_speed"] = argument_array[2];
action_map[?"bullet_range"] = argument_array[3];
action_map[?"bullet_radius"] = argument_array[4];
action_map[?"bullet_count"] = argument_array[5];
action_map[?"bullet_particles"] = argument_array[6];
action_map[?"bullet_impact_health"]  = argument_array[7];
action_map[?"bullet_explosion_radius"]  = argument_array[8];
action_map[?"bullet_explosion_trigger"]  = argument_array[9];

action_map[?"bullet_chaos_speed"] = argument_array[10];
action_map[?"bullet_chaos_range"] = argument_array[11];
action_map[?"bullet_chaos_angle"] = argument_array[12];

action_map[?"bullet_angle_spread"] = argument_array[13];
action_map[?"bullet_seek_range"] = argument_array[14];
action_map[?"bullet_seek_turn_rate"] = argument_array[15];
action_map[?"bullet_seek_angle_limit"] = argument_array[16];
action_map[?"bullet_tile_phase"] = argument_array[17];

action_map[?"damage"] = argument_array[18];
action_map[?"flinch"] = argument_array[19];
action_map[?"push"] = argument_array[20];

action_map[?"fire_recoil"] = argument_array[21];
action_map[?"fire_angle"] = 0

ds_map_copy(action_map_source, action_map);
ds_map_destroy(action_map);