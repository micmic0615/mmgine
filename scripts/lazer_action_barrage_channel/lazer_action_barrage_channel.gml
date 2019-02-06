var target_point = argument0;

entity_move_point(target_point);
actor_buff_apply("speed_bonus_percent", 2, [100], "speed_bonus_fire");
actor_buff_apply("armor_poise", 2, [-500], "armor_penalty_fire");