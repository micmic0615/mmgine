var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];


hero_beatdown_crash_damage([base_target, base_value, base_lethal, damage_id]);

if (base_target != id){
	
	var beatdown = false
	if (base_target.entity_class_lower == "actor"){
		var me = id;
		with(base_target){
			if (actor_buff_find("flinched") != undefined){beatdown = true}
		}
	}

			
	if (damage_id == "main_attack"){
		if (beatdown){
			var total_heal = base_value*(my_rally_lifesteal_beatdown/100);
		} else {
			var total_heal = base_value*(my_rally_lifesteal_normal/100);
		}
	
		my_rally_lifebank += total_heal;
		var whole_heal = floor(my_rally_lifebank);
		my_rally_lifebank -= whole_heal;
		var offset_angle = degtorad(270 + random(30) - 15);
		var previous_health = status_health_current;
		status_health_current = min(status_health_current + whole_heal, floor(my_rally_limit));

		var healed_amount = status_health_current - previous_health;
		if (healed_amount > 0){
			entity_draw_text_following("+"+string(healed_amount), [cos(offset_angle)*40, sin(offset_angle)*40], 1.5*SEC, c_red, 24);
		}
	}
	
}



return [base_target, base_value, base_lethal];