var argument_array = argument0;

action_dash_speed = argument_array[0];
action_dash_range = argument_array[1];

action_dash_channel_value = argument_array[2];
action_dash_channel_timer = 0;



action_dash_combo_max = argument_array[4];
action_dash_combo_count = 0;
action_dash_combo_timer = 0;

action_dash_cooldown_value = argument_array[3];
action_dash_cooldown_multi_timer = array_create(action_dash_combo_max, 0)

action_dash_flair_color = argument_array[5];

action_dash_target_point = [0,0];
action_dash_target_angle = 0;

action_dash_queue_cast = false;
action_dash_queue_target = [0,0];

ds_list_add(actor_actions_module, ["dash", [
	"step"
]])