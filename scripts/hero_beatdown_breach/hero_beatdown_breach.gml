var args = argument[0];
var base_target = args[0];
var base_value = args[1];

var bullet_count = 0;
var bullet_max = 8;

var bullet_radius = 40;
var bullet_speed = status_movespeed_base*1.5;
var bullet_range = bullet_speed*5*SEC;
var bullet_damage_factor = 0.15;

hero_mod_shoot_breach();
var spread_angle = 360;

var explosion_radius = 80;

var me = id;
with(BULLET){
	if(entity_enabled() && bullet_spawn_group == "hero_breach_summon"){
		var new_radius = explosion_radius*2.5;
		bullet_death_spawn[?"explosion_radius_max"] = new_radius;
		bullet_death_spawn[?"explosion_lifespan_base"] = new_radius/(280*PPS);
		bullet_death_spawn[?"explosion_lifespan_current"] = new_radius/(280*PPS);;
		bullet_death_spawn[?"bullet_collision_entity_actions"] = [
			["damage", "actor", me.status_damage_total*bullet_damage_factor*1.75, true, "main_attack"]
		]
		
		bullet_lifespan = 1;
	}
}

while(bullet_count < bullet_max){
	var bullet_angle = angle_between(base_target.x,base_target.y,x,y) + ((spread_angle/bullet_max)*bullet_count) - (spread_angle*0.5);
	var rad_angle = degtorad(bullet_angle);	
			
	var spawn_x = cos(rad_angle)*120;
	var spawn_y = sin(rad_angle)*120;
			
	var bullet = hero_bullet_create([
		bullet_angle,
		bullet_radius,
		bullet_speed, 
		bullet_range,
		bullet_damage_factor,
		my_shoot_bullet_type,
		my_shoot_flair_color,
		false,
		spawn_x, 
		spawn_y
	]);
	
	
	
	bullet.bullet_collision_cooldown_value = 1*SEC;
	
	bullet.bullet_spawn_group = "hero_breach_summon";
	
	bullet.breach_dash_cooldown_value = 0.5*SEC;
	bullet.breach_dash_cooldown_timer = random(1)*bullet.breach_dash_cooldown_value;
	
	
	bullet.bullet_seek_range = INFINITY;
	bullet.bullet_seek_turn_rate = status_movespeed_base*1;
	bullet.bullet_seek_angle_limit = 360;
	bullet.bullet_seek_target = id;
	bullet.bullet_seek_no_decay = false;
	
	bullet.collision_destroy_value_max = 10;
	bullet.collision_destroy_value_current = bullet.collision_destroy_value_max;
	
	bullet.collision_enabled_bullets = true;
	
	bullet.bullet_death_spawn_trigger = "always";
		
	bullet.bullet_death_spawn[?"explosion_radius_max"] = explosion_radius;
	bullet.bullet_death_spawn[?"explosion_lifespan_base"] = explosion_radius/(160*PPS);
	bullet.bullet_death_spawn[?"explosion_lifespan_current"] = explosion_radius/(160*PPS);;
	bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = my_shoot_flair_color;
	bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
	bullet.bullet_death_spawn[?"status_immortal"] = true;
	
	bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
		["damage", "actor", status_damage_total*bullet_damage_factor, true, "main_attack"]
	]
		
	bullet_count++;
}