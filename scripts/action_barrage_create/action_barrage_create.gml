var argument_array = argument0;

action_barrage_bullet_type = argument_array[0];
action_barrage_color = argument_array[1];

action_barrage_active = false;

action_barrage_angle_turn_rate_cast = argument_array[2];
action_barrage_angle_turn_rate_channel = argument_array[3]
action_barrage_angle_active = 0;

action_barrage_bullet_radius = argument_array[4];
action_barrage_bullet_speed = argument_array[5];
action_barrage_bullet_range = argument_array[6];

action_barrage_cast_timer = 0;
action_barrage_cast_value = argument_array[7];

action_barrage_channel_timer = 0;
action_barrage_channel_value = argument_array[8];

action_barrage_cooldown_timer = 0;
action_barrage_cooldown_value = argument_array[9];

action_barrage_interval = argument_array[10];

action_barrage_target_point = [x,y]

action_barrage_damage = argument_array[11];
action_barrage_flinch = argument_array[12];
action_barrage_push = argument_array[13];

action_barrage_particles = argument_array[14];

action_barrage_recoil = 0;
action_barrage_angle_chaos = 0;
action_barrage_animation_channel = "channel";
action_barrage_animation_attack = "attack";
action_barrage_collision_destroy_value = 1;

action_barrage_bullet_seek_range = 360;
action_barrage_bullet_seek_turn_rate = 120*PPS;
action_barrage_bullet_seek_angle_limit = 90;

ds_list_add(actor_actions_module, ["barrage", [
	"step"
]])