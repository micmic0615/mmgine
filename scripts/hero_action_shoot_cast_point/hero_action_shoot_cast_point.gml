var action_map = argument[0];

var charge_value = my_charge_current < my_charge_min ? 0 : my_charge_current/my_charge_max;
if (charge_value < 1){charge_value = min(power(charge_value, 5), 0.5)}

var bonus_size = my_charge_factor_size - 1;
var bonus_speed = my_charge_factor_speed - 1;
var bonus_range = my_charge_factor_range - 1;
var bonus_damage = my_charge_factor_damage - 1;
var bonus_flinch = my_charge_factor_flinch - 1;
var bonus_explosion = my_charge_factor_explosion - 1;

if (charge_value == 1){
	action_map[?"combo_count"] = 0;
}

var max_combo = (action_map[?"combo_count"] % action_map[?"combo_max"]) == (action_map[?"combo_max"] - 1);
if (max_combo){charge_value = 1};
action_map[?"bullet_radius"] = my_shoot_bullet_radius * (1 + (charge_value*bonus_size));
action_map[?"bullet_range"] = my_shoot_bullet_range * (1 + (charge_value*bonus_range))
action_map[?"bullet_speed"] = my_shoot_bullet_speed * (1 + (charge_value*bonus_speed));
action_map[?"bullet_explosion"] = my_shoot_bullet_explosion_radius * (1 + (charge_value*bonus_explosion));

var particle_holder = array_create(1);

if (charge_value == 1){
	entity_sfx_create_pulse(
		/*sprite*/ ExplosionBulletAlt_idle,
		/*duration*/ 0.35*SEC*TIMESPEED,
		/*blend*/ my_shoot_color,
		/*style_data*/ [
			150,
			30,
			2
		]
	)
	
	var p_spawn = 30;
	part_emitter_region(global.particle_system,draw_particle_emitter,x+random_mirror(p_spawn),x+random_mirror(p_spawn),y+random_mirror(p_spawn),y+random_mirror(p_spawn),ps_shape_ellipse,1);
		
	var p_loop = 8;
		
	while(p_loop > 0){
		var p_count = 4;
		var p_model = game_particle_setup_basic(my_shoot_color, 3, (2 + random(1)), ((0.3*SEC) + random(0.1*SEC)), pt_shape_snow);
		part_emitter_burst(global.particle_system,draw_particle_emitter,p_model,p_count);
		p_loop --;
	}
	
	particle_holder[0] = [game_particle_setup_basic(my_shoot_color, max(2, 4*action_map[?"bullet_radius"]/150), 0.5, 0.3*SEC), ceil(6*charge_value), action_map[?"bullet_radius"]];
} else if (charge_value > 0){
	particle_holder[0] = [game_particle_setup_basic(my_shoot_color, max(1, 2*action_map[?"bullet_radius"]/150), 0.5, 0.3*SEC), ceil(4*charge_value), action_map[?"bullet_radius"]];
} 

action_map[?"bullet_particles"] = particle_holder

action_map[?"fire_recoil"] = my_shoot_fire_recoil*2
if (charge_value < 1){
	status_poise_current = max(1, (1 - my_shoot_poise_cost)*status_poise_current);
	action_map[?"fire_recoil"] = my_shoot_fire_recoil * (1 + (charge_value*0.5))
}
	
if (my_shoot_aim_mode == true){
	action_map[?"fire_recoil"] *= my_frenzy_timer > 0 ? 0.1 : 0.35;
}

action_map[?"damage"] = [
	my_shoot_damage[0] * (1 +  (charge_value*bonus_damage)),
	my_shoot_damage[1] * (1 +  (charge_value*bonus_damage)),
];

action_map[?"flinch"] = [
	my_shoot_flinch[0] * (1 +  (charge_value*bonus_flinch)),
	my_shoot_flinch[1] * (1 +  (charge_value*bonus_flinch)),
];

if (my_shoot_aim_mode == true){
	action_map[?"push"] = [
		my_shoot_push[0] * my_frenzy_timer > 0 ? 0.1 : 0.25,
		my_shoot_push[1] * my_frenzy_timer > 0 ? 0.1 : 0.25,
	]
	action_map[?"bullet_speed"] *= 1.4;
	action_map[?"bullet_radius"] *= 0.8;
} else {
	action_map[?"push"] = my_shoot_push;
}

my_charge_current = 0;
switch(my_charge_active){
	case 1: my_charge_meter_1 = 0; break;
	case 2: my_charge_meter_2 = 0; break;
}

if (hero_passive_find("focus")){
	my_charge_current = 0;
	switch(my_charge_active){
		case 1: my_charge_meter_2 = my_charge_meter_2 < my_charge_max ? min(my_charge_meter_2 + 0.5*SEC, my_charge_max - TIMESPEED) : my_charge_max; break;
		case 2: my_charge_meter_1 = my_charge_meter_1 < my_charge_max ? min(my_charge_meter_1 + 0.5*SEC, my_charge_max - TIMESPEED) : my_charge_max; break;
	}
}

if(my_shoot_poise_cost > 0){
	actor_buff_apply("regen_poise",1*SEC, [status_poise_regen_base*-1], "action_cost");
}