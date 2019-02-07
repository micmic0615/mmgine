var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var me = id;
hero_mod_shoot_crash();

with(base_target){
	var over_flinch = abs(base_target.status_poise_current - base_value);
	var over_flinch_ratio = min(over_flinch / status_poise_max, 1);
	if (over_flinch_ratio < 0.5){over_flinch_ratio = 0};
	
	var flinch_duration = status_flinch_duration * (1.75 + (over_flinch_ratio * 1.75));
	
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ flinch_duration,
		/*blend*/ me.my_shoot_color,
		/*style_data*/ [
			160,
			40,
			2
		]
	);
	
	actor_buff_apply("flinched", flinch_duration, [], "flinched")
	
	if (variable_instance_exists(base_target, "action_clone_original")){
		for(var i = 0; i < ds_list_size(action_clone_family);i++){
			var p = ds_list_find_value(action_clone_family, i);
			with(p){
				actor_buff_apply("flinched", flinch_duration, [], "flinched")
			}
		};
	}
};	