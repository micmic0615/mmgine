var bullet_angle = angle_between(action_shoot_target_point[0], action_shoot_target_point[1], x,y);
var bullet_max = 1;
var bullet_damage_factor = 1;
var bullet_flinch_factor = 1;
var bullet_size_factor = 1;
var bullet_life_factor = 1;
var bullet_speed_factor = 1;
var bullet_push_factor = 1;
var bullet_spawn_offset = 0;

var charge_power_ratio = 1;
var charge_bonus_factor = 1;
var channel_multiplier_bullet = 1;

var bullet_count = bullet_max;
	
var bullet_x = cos(degtorad(bullet_angle))*bullet_spawn_offset + x;
var bullet_y = sin(degtorad(bullet_angle))*bullet_spawn_offset + y;
	
var bullet_spread_angle = 10;

action_shoot_combo_count++;
action_shoot_combo_timer = action_shoot_cast_value + action_shoot_channel_value + action_shoot_backswing_value;

while(bullet_count > 0){
	var bullet = actor_spawn_bullet(action_shoot_target_point[0], action_shoot_target_point[1], bullet_x,bullet_y, action_shoot_bullet_type);
	
	bullet.status_movespeed_base = action_shoot_bullet_speed * bullet_speed_factor;
	bullet.status_movesnap_base = 0.2*SEC;
	bullet.bullet_action_move_angle = bullet_angle + ((bullet_count-1)*bullet_spread_angle) - ((bullet_max-1)*(bullet_spread_angle/2));
		
	var rad_bullet_angle = degtorad(bullet.bullet_action_move_angle);
		
	bullet.animation_angle = point_direction(x,y,cos(rad_bullet_angle)*10 + x, sin(rad_bullet_angle)*10 + y)
	
	bullet.physics_gravity_on = false;
	
	bullet.image_xscale = (action_shoot_bullet_radius*2)/sprite_get_width(sprite_index);
	bullet.image_yscale = (action_shoot_bullet_radius*2)/sprite_get_height(sprite_index);
		
	bullet.bullet_seek_range = 240;
	bullet.bullet_seek_turn_rate = 160*PPS;
	bullet.bullet_lifespan = ((((action_shoot_bullet_range*PPS)/TIMESPEED)/action_shoot_bullet_speed)*SEC) * bullet_life_factor;
	bullet.bullet_collision_tile_action = "die";
		
	bullet.animation_sprite = channel_multiplier_bullet == 2 ? "HeroBullet3" : "HeroBullet1";
		
	var bullet_damage_value = status_damage_total + ((charge_power_ratio * charge_bonus_factor)*status_damage_total)
	var bullet_flinch_value = status_force_total + ((charge_power_ratio * charge_bonus_factor)*status_force_total)
	
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", bullet_damage_value*bullet_damage_factor, true, "main_attack"]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", bullet_flinch_value*bullet_flinch_factor]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", 100*channel_multiplier_bullet*bullet_push_factor , 0.75*SEC, "movement", ["multiply",1.5]]);
		
	ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "bullet", channel_multiplier_bullet == 2 ? INFINITY : 1, true]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "actor", INFINITY]);
	ds_list_add(bullet.bullet_collision_entity_actions, ["self_damage", "bullet", 1]);
		
	bullet.bullet_death_spawn[?"explosion_radius_max"] = round(action_shoot_bullet_explosion*(bullet_damage_value*bullet_damage_factor / status_damage_total));
	bullet.bullet_death_spawn[?"draw_blend_temporary_color"] = make_color_rgb(255,125,0)
	bullet.bullet_death_spawn[?"draw_blend_temporary_duration"] = INFINITY;
	bullet.bullet_death_spawn[?"status_immortal"] = true;
		
	if (channel_multiplier_bullet == 2){
		bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
			["damage", "actor", bullet_damage_value*bullet_damage_factor*0.25, true],
			["flinch", "actor", bullet_flinch_value*bullet_flinch_factor*1],
		]
	} else {
		bullet.bullet_death_spawn[?"bullet_collision_entity_actions"] = [
			["damage", "actor", bullet_damage_value*bullet_damage_factor*0.25, true],
		]
	}
		
	bullet_count --;
}	

entity_motion_push((action_shoot_recoil_range), (action_shoot_recoil_speed/(action_shoot_recoil_range*PPS))*SEC, bullet_angle - 180, ["multiply",1.25], "move_motion");


