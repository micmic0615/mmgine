var hero_actor = ROOM.player_main_actor;
hero_actor.status_health_current = hero_actor.status_health_max;
hero_actor.status_poise_current = hero_actor.status_poise_max;
hero_actor.my_shield_damage_accumulated = hero_actor.my_shield_damage_treshold;
stage_phase_delay_timer = stage_phase_delay_value;
stage_trigger = true;
stage_restore_health_timer = stage_restore_health_duration;
stage_phase++;