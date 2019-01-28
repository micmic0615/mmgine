var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var me = id;
hero_mod_shoot_crash();

with(base_target){
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ status_flinch_duration,
		/*blend*/ me.my_shoot_flair_color,
		/*style_data*/ [
			160,
			40,
			2
		]
	);
	
	actor_buff_apply("flinched", status_flinch_duration*2, [], "flinched")
};	