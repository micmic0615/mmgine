
//my_charge_current = my_charge_current*0.75;

show_debug_message(actor_actions_id)
if (actor_actions_id == "shoot"){
	action_dash_speed = my_dash_speed*1.25;
	action_dash_range = my_dash_range*1.5;
} else {
	action_dash_speed = my_dash_speed;
	action_dash_range = my_dash_range;
}

my_charge_current = max(1, my_charge_current - my_dash_charge_cost);