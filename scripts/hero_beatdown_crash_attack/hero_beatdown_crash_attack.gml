var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

var me = id;



if (hero_beatdown_find("crash")){
	if (damage_id == "main_attack"){
		var bonus_projectile = false;
		with(base_target){
			var flinched = actor_buff_find("flinched");
			if (flinched != undefined){
				bonus_projectile = true;
			}
		}
		
		if (bonus_projectile){
			hero_mod_shoot_crash();

			var bullet_angle = angle_between(base_target.x,base_target.y,x,y);
			var bullet_damage_factor = (base_value*0.25)/status_damage_total;
			var bullet_radius = 24 + (bullet_damage_factor*48);
			var bullet_speed = 1000*PPS;
			var bullet_range = 1000;


			var rad_angle = degtorad(bullet_angle);
			
			var spawn_x = (cos(rad_angle)*-150) + random_mirror(90);
			var spawn_y = (sin(rad_angle)*-150) + random_mirror(90);
			
			var bullet = hero_bullet_create([
				bullet_angle,
				bullet_radius,
				bullet_speed, 
				bullet_range,
				bullet_damage_factor, 
				my_shoot_bullet_type,
				my_shoot_color,
				false,
				spawn_x, 
				spawn_y
			]);
			
			bullet.bullet_seek_range = INFINITY;
			bullet.bullet_seek_turn_rate = 360*PPS;
			bullet.bullet_seek_angle_limit = 360;
			bullet.bullet_seek_target = base_target;
			
			hero_beatdown_bullet_sfx(bullet, my_shoot_color, bullet_radius);
		}
		
	}
}