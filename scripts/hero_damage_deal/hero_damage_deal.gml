var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];

var total_heal = base_value*(my_rally_lifesteal/100);
var beatdown = false
if (base_target.entity_class_lower == "actor"){
	var me = id;
	with(base_target){
		if (actor_buff_find("flinched") != undefined){beatdown = true}
	}
}

if (beatdown){
	base_value *= me.my_attack_beatdown_damage_amplification;
	//me.my_rally_limit = min(me.my_rally_limit + (total_heal*0.5), me.status_health_max);
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




return [base_target, base_value, base_lethal];