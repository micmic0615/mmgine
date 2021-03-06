var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var deducted_flinch = base_target.status_poise_current - base_value;



if (deducted_flinch  <= 0 && base_target.status_health_current > 0){	
	var is_flinched = false;
	with(base_target){if (actor_buff_find("flinched") != undefined){is_flinched = true}};

	if (!is_flinched){
		hero_beatdown_trigger(args);
		var over_flinch = min(abs(deducted_flinch)/base_target.status_poise_max, 1);
		if (over_flinch < 0.5){over_flinch = 0};
		
		if (over_flinch > 0){
			var over_damage = over_flinch*status_damage_total*5;
			with(base_target){
				entity_sfx_create_pulse(
					/*sprite*/ ExplosionBulletAlt_idle,
					/*duration*/ 0.65*SEC,
					/*blend*/ make_color_rgb(255,255,0),
					/*style_data*/ [
						30,
						120,
						2
					]
				);
			}
				
			entity_damage_deal([base_target, over_damage, false, "main_attack"])
		}
	}
}

return [base_target, base_value];