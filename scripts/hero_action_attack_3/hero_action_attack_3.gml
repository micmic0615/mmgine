var target_point = argument0;
var my_attack_combo_2_max = 3;


if (hero_can_act() && status_poise_current/status_poise_max >= 0.5){	
	
	var charge_power_ratio = my_attack_channel_power_current/my_attack_channel_power_max;
	
	var iframe_duration = my_attack_3_immortal_duration
	if (status_immortal){
		hero_shield_pulse(5, 800, 200)
		iframe_duration += 0.5*SEC
	} else {
		hero_shield_pulse(1.5, 300, 50)
	}
	
	if (charge_power_ratio == 1){
		iframe_duration += 0.5*SEC
	}
	
	var bullet = actor_spawn_bullet(x, y, x,y,ExplosionBullet);
	
	bullet.animation_sprite = "ExplosionBulletAlt";
	bullet.status_movespeed_base = 0;
	bullet.bullet_origin_anchor = true;
							
	bullet.status_health_max = INFINITY;
	bullet.status_health_current = bullet.status_health_max;
	bullet.bullet_action_move_angle = 0;
	
	bullet.physics_gravity_on = false;
	bullet.explosion_lifespan_base = 0.075*SEC;			
	bullet.explosion_lifespan_current = bullet.explosion_lifespan_base;			
	bullet.explosion_radius_min = 30;
	bullet.explosion_radius_max = 160;
	bullet.collision_compute = false;
	bullet.collision_enabled_actors = false;
	bullet.collision_enabled_bullets = false;
	bullet.collision_enabled_doodads = false;
		
	bullet.draw_blend_temporary_color = make_color_rgb(255,0,255);
	bullet.draw_blend_temporary_duration = INFINITY;
							
	bullet.bullet_death_spawn[?"type"] = noone;
		
	my_attack_super_duration += (status_poise_current/status_poise_max)*2*SEC;
	if (charge_power_ratio == 1){my_attack_super_duration += 0.5*SEC}
	my_attack_super_target_angle = undefined;
	
	status_poise_current = 0;
	
	my_attack_cast_timer_3 = my_attack_cast_value_3;
	my_attack_channel_power_current = 0;
	
	actor_buff_apply("immortal", iframe_duration, [], "on_hit_iframe");
}