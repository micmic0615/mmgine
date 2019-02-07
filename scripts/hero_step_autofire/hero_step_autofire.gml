for(var i = 0; i < ds_list_size(my_autofire_list);i++){
	var p = ds_list_find_value(my_autofire_list, i);
	
	var duration = p[0];
	var target = p[1];
	var interval = p[2];
	
	var bullet_radius = p[3];
	var bullet_speed = p[4];
	var bullet_range = p[5];
	var bullet_damage_factor = p[6];
	
	var bullet_type = p[7];
	var bullet_color = p[8];
	var bullet_seek = p[9];
	var bullet_extra = p[10];
	var autofire_id = p[11];
	
	var new_duration = duration - TIMESPEED;
	if (new_duration > 0){
		ds_list_replace(my_autofire_list, i, [
			new_duration,
			target,
			interval,
			bullet_radius,
			bullet_speed,
			bullet_range,
			bullet_damage_factor,
			bullet_type,
			bullet_color,
			bullet_seek,
			bullet_extra,
			autofire_id
		]);
	
		if (
			floor(duration) != floor(new_duration) &&
			floor(new_duration % interval) == 0
		){
			var bullet_angle = random(360);
			var spawn_x = random(140) - 70;
			var spawn_y = random(140) - 70;
			
			var bullet = hero_bullet_create([
				bullet_angle,
				bullet_radius,
				bullet_speed, 
				bullet_range,
				bullet_damage_factor, 
				bullet_type,
				bullet_color,
				true,
				spawn_x, 
				spawn_y
			]);
			
			bullet.bullet_seek_range = bullet_seek[0];
			bullet.bullet_seek_turn_rate = bullet_seek[1];
			bullet.bullet_seek_angle_limit = bullet_seek[2];
			
			bullet.collision_impact_health_max = bullet_extra[0];
			bullet.collision_impact_health_current = bullet_extra[0];
			
			bullet.collision_enabled_bullets = bullet_extra[1];
			
			hero_beatdown_bullet_sfx(bullet, bullet_color, bullet_radius);
			
			if (target != noone && entity_enabled(target)){
				bullet.bullet_seek_target = target;
		
			}
		}
	}
}

for(var i = 0; i < ds_list_size(my_autofire_list);i++){
	var p = ds_list_find_value(my_autofire_list, i);
	if (p != undefined){
		var duration = p[0];
		if (duration <= 0){ds_list_delete(my_autofire_list, i)}
	}
}
