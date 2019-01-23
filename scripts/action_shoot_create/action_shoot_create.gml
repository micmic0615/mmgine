var argument_array = argument0;

action_shoot_bullet_type = argument_array[0];
action_shoot_bullet_radius = argument_array[1];
action_shoot_bullet_speed = argument_array[2];
action_shoot_bullet_range = argument_array[3]; 
action_shoot_bullet_count = argument_array[4];
action_shoot_bullet_explosion = argument_array[5];

action_shoot_recoil_speed = argument_array[6];
action_shoot_recoil_range = argument_array[7];

action_shoot_cast_value = argument_array[8];
action_shoot_cast_timer = 0;

action_shoot_channel_value = argument_array[9];
action_shoot_channel_timer = 0;

action_shoot_backswing_value = argument_array[10];
action_shoot_backswing_timer = 0;

action_shoot_cooldown_value = argument_array[11];
action_shoot_cooldown_timer = 0;

action_shoot_combo_max = argument_array[12];
action_shoot_combo_count = 0;
action_shoot_combo_timer = 0;

action_shoot_damage = argument_array[13];
action_shoot_flinch = argument_array[14];
action_shoot_push = argument_array[15];

action_shoot_flair_color = argument_array[16];

action_shoot_direction = 1;
action_shoot_step_phase = 0;

action_shoot_target_point = [0,0];
action_shoot_target_angle = 0;

action_shoot_queue_cast = false;
action_shoot_queue_angle = 0;

action_shoot_angle_chaos = 0;

action_shoot_bullet_seek_range = 240;
action_shoot_bullet_seek_turn_rate = 160*PPS;
action_shoot_bullet_collision_destroy_value = 1;

action_shoot_flag_explode_trigger = "death";