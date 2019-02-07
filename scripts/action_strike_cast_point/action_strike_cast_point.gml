var action_map = argument[0];
var target_point = action_map[?"target_point"];
entity_run_type_scripts("action_strike_cast_point", target_point);

var strike_angle = angle_between(target_point[0], target_point[1], x,y);
var rad_angle = degtorad(strike_angle);

action_map[?"target_point"] = [
	x + (cos(rad_angle)*INFINITY),
	y + (sin(rad_angle)*INFINITY)
];

entity_motion_push(action_map[?"range"], action_map[?"range"]/action_map[?"speed"], strike_angle, ["multiply",action_map[?"dash_multiply"]], "move_motion");

var bullet = actor_spawn_bullet(0, 0, x, y, DefaultBullet);	

bullet.animation_sprite = "HeroBulletClear";
bullet.draw_blend_temporary_color = action_map[?"color"];
bullet.draw_blend_temporary_style = "solid";
bullet.draw_blend_temporary_duration = INFINITY;
bullet.bullet_lifespan = action_map[?"channel_value"];
bullet.collision_impact_health_max = INFINITY;
bullet.collision_impact_health_current = INFINITY;
bullet.bullet_origin_anchor = true;
bullet.collision_enabled_tiles = false;
bullet.collision_enabled_bullets = false;
bullet.image_xscale = (action_map[?"radius"]*2)/sprite_get_width(sprite_index);
bullet.image_yscale = (action_map[?"radius"]*2)/sprite_get_height(sprite_index);

var damage_factor = action_map[?"damage"];
var flinch_factor = action_map[?"flinch"];
var push_value = action_map[?"push"];

ds_list_add(bullet.bullet_collision_entity_actions, ["damage", "actor", status_damage_total*damage_factor[0], true, "main_attack"]);
ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", "actor", status_flinch_total*flinch_factor[0]]);
ds_list_add(bullet.bullet_collision_entity_actions, ["push", "actor", push_value[0], 0.5*SEC, "origin", ["multiply",1.25]]);		

bullet.bullet_death_spawn[?"type"] = noone;