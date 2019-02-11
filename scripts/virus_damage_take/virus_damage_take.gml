var args = argument0;

var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];
var me = id;

if (status_health_current - base_value <= 0 && base_lethal){
	with(base_source){
		if (entity_enabled() && entity_class_lower == "actor"){
			actor_buff_apply("armor_health", me.my_aura_duration*1.5, [50], "virus_bonus");
		}
	}
	
	var bullet = actor_spawn_bullet(0, 0, x,y, DefaultBullet);
	bullet.bullet_seek_range = 0;
	bullet.bullet_lifespan = 1.5*SEC;
	bullet.animation_sprite = "HeroBulletClear";
	bullet.status_movespeed_base = 0;

	bullet.collision_enabled_actors = false;
	bullet.collision_enabled_bullets = false;
	bullet.collision_enabled_doodads = false;

	ds_list_add(
		bullet.draw_particle_list, 
		[game_particle_setup_basic(c_red, 2 + random(3), 0.5, 0.25*SEC), 12, 30]
	);
				
	ds_list_add(
		bullet.draw_particle_list, 
		[game_particle_setup_basic(c_purple, 2 + random(3), 0.25, 0.15*SEC), 12, 30]
	);


	
	var explosion_radius = 480;
	var explosion_push = -200;

	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ bullet.bullet_lifespan,
		/*blend*/ c_purple,
		/*style_data*/ [
			explosion_radius,
			60,
			0.5
		]
	);

	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ bullet.bullet_lifespan,
		/*blend*/ c_red,
		/*style_data*/ [
			explosion_radius - 60,
			explosion_radius,
			1
		]
	);

	
	with(ACTOR){
		if (entity_enabled() && id != me){
			if (me.player_faction == player_faction && distance_between(x,y,me.x,me.y) < me.my_aura_radius){
				actor_buff_apply("rooted", me.my_aura_duration, [], "virus_root");
			}
		}
	}
	
	bullet.bullet_death_spawn_trigger = "always";
		
	bullet.bullet_death_spawn[?"explosion_radius_max"] = explosion_radius;
	bullet.bullet_death_spawn[?"explosion_lifespan_base"] = explosion_radius/(640*PPS);
	bullet.bullet_death_spawn[?"explosion_lifespan_current"] = explosion_radius/(640*PPS);
	bullet.bullet_death_spawn[?"collision_faction"] = "all";
	bullet.bullet_death_spawn[?"draw_blend_permanent_color"] = c_red;
	bullet.bullet_death_spawn[?"status_immortal"] = true;
	//bullet.bullet_death_spawn[?"animation_sprite"] = "ExplosionBulletAlt";

	
	bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
		["damage", "actor", status_damage_total, true],
		["push", "actor", explosion_push, 0.5*SEC, "center", ["multiply",1.5]],
	]
}

