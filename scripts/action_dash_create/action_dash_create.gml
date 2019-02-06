var argument_array = argument0;

action_dash = ds_create("map");

action_dash[?"color"] = argument_array[0];

action_dash[?"speed"] = argument_array[1];
action_dash[?"range"] = argument_array[2];

action_dash[?"combo_max"] = argument_array[3];
action_dash[?"combo_count"] = 0;
action_dash[?"combo_timer"] = 0;

action_dash[?"cast_value"] = argument_array[4];
action_dash[?"cast_timer"] = 0;

action_dash[?"channel_value"] = argument_array[5];
action_dash[?"channel_timer"] = 0;

action_dash[?"backswing_value"] = argument_array[6];
action_dash[?"backswing_timer"] = 0;

action_dash[?"cooldown_multi_value"] = argument_array[7];
action_dash[?"cooldown_multi_timer"] = ds_create("list");
action_dash_cooldown_reset();

action_dash[?"cooldown_value"] = 0;
action_dash[?"cooldown_timer"] = 0;

action_dash[?"target_point"] = [0,0];
action_dash[?"target_angle"] = 0;

action_dash[?"queue_active"] = false;
action_dash[?"queue_angle"] = 0;

action_dash[?"sequence"] = 0;

action_dash[?"animation_cast"] = "rise";
action_dash[?"animation_channel"] = "dash";
action_dash[?"animation_backswing"] = "dash";

ds_list_add(actor_actions_module, ["dash", [
	"step"
]])