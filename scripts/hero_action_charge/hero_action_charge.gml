var prev_charge = my_charge_current;

if (actor_actions_idle && my_charge_current < my_charge_max){
	var charge_sfx_interval = 0.4*SEC;
	if (action_shoot_backswing_timer <= 0){
		my_charge_current += TIMESPEED
	} else {
		my_charge_current += TIMESPEED*6
		charge_sfx_interval = 0.1*SEC;
	}
	
	var floor_age = floor(ROOM.room_age_game);
	var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);
	
	if (floor_age != next_floor_age && floor_age % (charge_sfx_interval) == 0){
		entity_sfx_create(
			ExplosionBulletAlt_idle,
			0.4*SEC*TIMESPEED,
			0,
			0,
			make_color_rgb(255,255,0),
			0,
			1,
			1,
			id,
			"expand",
			[
				40 + (60*(my_charge_current/my_charge_max)),
				20,
				0.35
			]
		)
	}
}


if (my_charge_current > my_charge_max){my_charge_current = my_charge_max};

if (my_charge_current < my_charge_max){
	status_poise_current -= status_poise_regen;
} else if (my_charge_current == my_charge_max && my_charge_max != prev_charge){
	entity_sfx_create(
		ExplosionBulletAlt_idle,
		0.25*SEC*TIMESPEED,
		0,
		0,
		make_color_rgb(255,255,0),
		0,
		1,
		1,
		id,
		"expand",
		[
			0,
			200,
			1.5
		]
	)
}