var argument_array = argument0;

action_chase_target = noone;
action_chase_success = false;

action_chase_distance = argument_array[0];
action_chase_movespeed_set = argument_array[1];
action_chase_movesnap_set = argument_array[2];

action_chase_active_timer = 0;
action_chase_active_value = argument_array[3];;

action_chase_cooldown_timer = 0;
action_chase_cooldown_value = argument_array[4];;

action_chase_color = argument_array[5];

ds_list_add(actor_actions_module, ["chase", [
	"step"
]])