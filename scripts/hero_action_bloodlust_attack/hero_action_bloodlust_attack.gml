var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

var me = id;

if (my_bloodlust_active_timer > 0){
	if (damage_id == "main_attack"){
		my_bloodlust_attack_bank += base_value;
		
		var bloodlust_power = 0;
		
		while(my_bloodlust_attack_bank > status_damage_base*my_bloodlust_attack_base_damage_factor){
			my_bloodlust_attack_bank -= (status_damage_base*my_bloodlust_attack_base_damage_factor);
			bloodlust_power += 1;
		}
		
		if (bloodlust_power >= 1){
			var bullet_damage_factor = bloodlust_power*0.25;
			var bullet_radius = 32;
			var bullet_speed = 800*PPS;
			var bullet_range = 1000;

			var bullet_loop = my_bloodlust_active_level;
		
			while(bullet_loop){
				var bullet_angle = random(360)
				var rad_angle = degtorad(bullet_angle);
			
				var spawn_x = (cos(rad_angle)*120) + random_mirror(60);
				var spawn_y = (sin(rad_angle)*120) + random_mirror(60);
		
				var bullet = hero_bullet_create([
					bullet_angle,
					bullet_radius,
					bullet_speed, 
					bullet_range,
					bullet_damage_factor, 
					[DefaultBullet, "HeroBulletClear"],
					make_color_rgb(255,0,0),
					false,
					spawn_x, 
					spawn_y
				]);
			
				with(bullet){
					entity_motion_push(120, 0.5*SEC, bullet_angle, ["multiply",1.25], "bullet_push");
				}
				
			
			
				ds_list_add(
					bullet.draw_particle_list, 
					[game_particle_setup_basic(make_color_rgb(255,50,50), 1.5 + random(1.5*bloodlust_power), 0.5, 0.25*SEC), ceil(2*bloodlust_power), bullet_radius*0.5]
				);
				
				ds_list_add(
					bullet.draw_particle_list, 
					[game_particle_setup_basic(my_shoot_flair_color, 1 + random(1*bloodlust_power), 0.25, 0.15*SEC), ceil(2*bloodlust_power), bullet_radius*0.25]
				);
			
				bullet.bullet_seek_range = 640;;
				bullet.bullet_seek_turn_rate = 360*PPS;
				bullet.bullet_seek_angle_limit = 360;
			
				bullet_loop--
			}
		}
	}
}