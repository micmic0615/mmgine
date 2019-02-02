actor_clone_original = true;
actor_clone_parent = id;
actor_clone_children = ds_create("list");
actor_clone_family = ds_create("list");
actor_clone_count = argument0;
actor_clone_active = false;
actor_clone_spread_distance_min = 80;
actor_clone_spread_distance_max = 0
actor_clone_spread_cooldown_timer = 0;
actor_clone_spread_cooldown_value = 0.5*SEC;

actor_clone_draw_timer = 0;

ds_list_add(actor_clone_family, id);

ds_list_add(actor_actions_module, ["clone", [
	"step",
	"draw",
	"flinch_take",
	"damage_take",
	"move_point",
	"move_angle"
]])