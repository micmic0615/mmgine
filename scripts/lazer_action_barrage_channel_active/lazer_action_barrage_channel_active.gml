var action_map = argument[0];
var target_point = action_map[?"target_point"]

entity_move_point(target_point);
actor_buff_apply("speed_bonus_percent", 2, [100], "speed_bonus_fire");
actor_buff_apply("armor_poise", 2, [-500], "armor_penalty_fire");