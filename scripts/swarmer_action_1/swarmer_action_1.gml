var target_point = argument0;

if (my_attack_cooldown_timer <= 0){	
	actor_buff_apply("movespeed_set_raw", my_attack_cast_value, [my_attack_cast_movespeed], "mana_speed_set");
	actor_buff_apply("movesnap_set_raw", my_attack_cast_value, [my_attack_cast_movesnap], "mana_snap_set");
	
	actor_buff_apply("armor_health", my_attack_cast_value, [my_attack_cast_armor_health], "mana_armor_health_1");
	actor_buff_apply("armor_poise", my_attack_cast_value, [my_attack_cast_armor_poise], "mana_armor_poise_1");
	
	
	my_attack_channel_power_current = 0;
	my_attack_cooldown_timer = my_attack_cooldown_value;	
	
	my_attack_cast_timer = my_attack_cast_value;
}