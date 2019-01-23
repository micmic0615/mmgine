var floor_age = floor(ROOM.room_age_game);
var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);

var prev_charge = my_charge_current;

if (actor_actions_idle && my_charge_current < my_charge_max){
	var charge_sfx_interval = 0.4*SEC;
	if (action_shoot_cast_timer <= 0 && action_shoot_channel_timer <= 0){
		my_charge_current += TIMESPEED
	} 
	
	if (floor_age != next_floor_age && floor_age % (charge_sfx_interval) == 0){
		entity_sfx_create_pulse(
			/*sprite*/ ExplosionBulletAlt_idle,
			/*duration*/ 0.4*SEC*TIMESPEED,
			/*blend*/ my_shoot_flair_color,
			/*style_data*/ [
				40 + (60*(my_charge_current/my_charge_max)),
				20,
				0.35
			]
		)
	}
}


if (my_charge_current > my_charge_max){my_charge_current = my_charge_max};

if (my_charge_current < my_charge_max){
	if (my_charge_current < my_charge_min){
		status_poise_current -= status_poise_regen;
	} else {
		status_poise_current -= status_poise_regen*0.8;
	}
} else if (my_charge_current == my_charge_max && my_charge_max != prev_charge){
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ 0.35*SEC*TIMESPEED,
		/*blend*/ my_shoot_flair_color,
		/*style_data*/ [
			0,
			220,
			2
		]
	)
} else if (floor_age != next_floor_age && floor_age % (0.1*SEC) == 0){
	var flicker_range = 30;
	entity_mirage_create(0.3*SEC, random(flicker_range) - (flicker_range/2), random(flicker_range) - (flicker_range/2), my_shoot_flair_color, animation_angle, animation_direction);
}