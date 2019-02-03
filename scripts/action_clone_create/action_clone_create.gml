action_clone_original = true;
action_clone_parent = id;
action_clone_children = ds_create("list");
action_clone_family = ds_create("list");
action_clone_count = argument0;
action_clone_active = false;
action_clone_spread_distance_min = 80;
action_clone_spread_distance_max = 0
action_clone_spread_cooldown_timer = 0;
action_clone_spread_cooldown_value = 0.5*SEC;

action_clone_draw_timer = 0;

ds_list_add(action_clone_family, id);

ds_list_add(actor_actions_module, ["clone", [
	"step",
	"draw",
	"flinch_take",
	"damage_take",
	"move_point",
	"move_angle"
]])