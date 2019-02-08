if (actor_actions_id == "shoot" && action_shoot[?"cast_timer"] > 0 ){
	action_dash[?"speed"] = my_dash_speed*1.25;
	action_dash[?"range"] = my_dash_range*1.5;
	action_dash_cooldown_reset();
	hero_dash_particles_create(5, 2, 1, c_white);
} else {
	action_dash[?"speed"] = my_dash_speed;
	action_dash[?"range"] = my_dash_range;
}

action_dash[?"color"] = my_dash_color

physics_gravity_current = 0;
actor_buff_apply("iframe", my_dash_iframe, [], "dash_iframe")

action_shoot[?"combo_count"] = 0;
my_charge_meter_1 =  max(1, my_charge_meter_1 - my_dash_charge_cost);
my_charge_meter_2 =  max(1, my_charge_meter_2 - my_dash_charge_cost);


hero_dash_split();
hero_dash_ping();
hero_dash_load();
hero_dash_breach();