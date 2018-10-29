var target_point = argument0;

var bullet = actor_spawn_bullet(target_point[0], target_point[1], x,y,DefaultBullet);

bullet.status_movespeed_base = 800*PPS;
bullet.status_movesnap_base = 0.2*SEC;

bullet.bullet_lifespan = 1*SEC;
bullet.bullet_collision_tile_action = "die";

ds_list_add(bullet.bullet_collision_entity_actions, ["damage", status_damage_total, true]);
ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", status_damage_total*2]);
ds_list_add(bullet.bullet_collision_entity_actions, ["push", 100, 1*SEC, bullet.bullet_action_move_angle, ["multiply",1.5]]);

actor_buff_apply("speed_raw", 1.5*SEC, [600*PPS], "mana_speed_boost")
entity_push_motion(150, 1*SEC, bullet.bullet_action_move_angle - 180, ["multiply",1.25])