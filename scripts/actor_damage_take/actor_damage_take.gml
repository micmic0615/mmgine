var args = argument0;
var adjusted_args = entity_run_type_scripts("damage_take", args);

if (ROOM.player_main_actor == id){
	ROOM.player_hit_slowmo = 0.5*SEC;
}

return adjusted_args;