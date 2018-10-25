var bullet = actor_spawn_bullet(x,y,DefaultBullet);

bullet.status_movespeed_base = 800*PPS;
bullet.status_movesnap_base = 0.2*SEC;

bullet.bullet_lifespan = 1*SEC;
bullet.bullet_collision_tile_action = "die";

ds_list_add(bullet.bullet_collision_entity_actions, ["damage", status_damage_total, true]);
ds_list_add(bullet.bullet_collision_entity_actions, ["flinch", status_damage_total*2]);
ds_list_add(bullet.bullet_collision_entity_actions, ["push", 100, 1*SEC, bullet.bullet_action_move_angle]);