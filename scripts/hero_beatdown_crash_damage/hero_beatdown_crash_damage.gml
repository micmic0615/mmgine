var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

var me = id;

hero_mod_shoot_crash();

var bullet_angle = angle_between(base_target.x,base_target.y,x,y);
var bullet_radius = 36;
var bullet_speed = 1000*PPS;
var bullet_range = 1000;
var bullet_damage_factor = (base_value*0.25)/status_damage_total;

var rad_angle = degtorad(bullet_angle);
			
var spawn_x = cos(rad_angle)*-150;
var spawn_y = sin(rad_angle)*-150;

if (hero_beatdown_find("crash")){
	if (damage_id == "main_attack"){
		var bonus_projectile = false;
		with(base_target){
			var flinched = actor_buff_find("flinched");
			if (flinched != undefined && flinched[1] > status_flinch_duration){
				bonus_projectile = true;
			}
		}
		
		if (bonus_projectile){
			var bullet = hero_bullet_create([
				bullet_angle,
				bullet_radius,
				bullet_speed, 
				bullet_range,
				bullet_damage_factor, 
				my_shoot_bullet_type,
				my_shoot_flair_color,
				spawn_x, 
				spawn_y
			]);
			
			bullet.bullet_seek_range = INFINITY;
			bullet.bullet_seek_turn_rate = 360*PPS;
			bullet.bullet_seek_angle_limit = 360;
			bullet.bullet_seek_target = base_target;
		}
		
	}
}