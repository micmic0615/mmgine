
if (actor_actions_id == "shoot" && action_shoot_cast_timer > 0 ){
	action_dash_speed = my_dash_speed*1.25;
	action_dash_range = my_dash_range*1.5;
	action_dash_combo_count = 0;
	action_dash_combo_timer = 0;
	action_dash_cooldown_timer = 0;
	action_dash_flair_color = make_color_rgb(180, 30, 255)
} else {
	action_dash_speed = my_dash_speed;
	action_dash_range = my_dash_range;
	action_dash_flair_color = my_dash_flair_color
}

actor_buff_apply("iframe", my_dash_channel, [], "dash_iframe")

action_shoot_combo_count = 0;
my_charge_current = max(1, my_charge_current - my_dash_charge_cost);
	

