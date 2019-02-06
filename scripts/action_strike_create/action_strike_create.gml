var argument_array = argument0;
action_strike_flair_color = argument_array[0];

action_strike_speed = argument_array[1];
action_strike_range = argument_array[2];

action_strike_cast_value = argument_array[3];
action_strike_cast_timer = 0;

action_strike_channel_value = argument_array[4];
action_strike_channel_timer = 0;

action_strike_backswing_value = argument_array[5];
action_strike_backswing_timer = 0;

action_strike_cooldown_value = argument_array[6];
action_strike_cooldown_timer = 0

action_strike_combo_count = 0;
action_strike_combo_timer = 0;

action_strike_radius = argument_array[7];
action_strike_damage = argument_array[8];
action_strike_flinch = argument_array[9];
action_strike_push = argument_array[10];

action_strike_target_point = [0,0];
action_strike_target_angle = 0;
action_strike_step_phase = 0;

ds_list_add(actor_actions_module, ["strike", [
	"step"
]])