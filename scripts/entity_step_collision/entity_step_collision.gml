var movement_x = argument0[0];
var movement_y = argument0[1];

var collision_count_entities = 0;
var collision_count_tiles = 0;
var base_x = x;
var base_y = y;
		
var final_x_push = 0;
var final_y_push = 0;
		
var move_steps_max = collision_persistent != true ? 1 : ((abs(movement_x) > abs(movement_y)) ? ceil(abs(movement_x) / sprite_width) :  ceil(abs(movement_y) / sprite_height));
var move_steps_current = move_steps_max;

switch(collision_contact_y){
	case "top": if (movement_y < -1){movement_y = -1}; break
	case "bottom": if (movement_y > 1){movement_y = 1}; break
}

switch(collision_contact_x){
	case "left": if (movement_x < -1){movement_x = -1}; break
	case "right": if (movement_x > 1){movement_x = 1}; break
}
	
while(move_steps_current > 0){
	base_x = x;
	base_y = y;
	
	
			
	x = base_x + movement_x/move_steps_max;
	y = base_y + movement_y/move_steps_max;
			
	move_steps_current--;
			
	if (collision_compute){	
		entity_collision_place_loop();
		
		var collision_count_entities = ds_list_size(collision_entities_connect);
		if (collision_solid_entities){
			for(var i = 0; i < collision_count_entities;i++){
				var p = ds_list_find_value(collision_entities_connect, i);
				if (entity_enabled(p) && p.collision_solid_entities && collision_pushable){
					if (
						(physics_motion_x != 0 || physics_motion_y != 0) || 
						(p.physics_motion_x != 0 || p.physics_motion_y != 0)
					){
						var push_replacer = entity_collision_compute_push(p, final_x_push, final_y_push);
						final_x_push = push_replacer[0];
						final_y_push = push_replacer[1];
					}
				}
			}
		}
		
			
		if (collision_solid_tiles){
			collision_count_tiles = entity_collision_check_tile(true);
			for(var i = 0; i < collision_count_tiles;i++){
				var p = ds_list_find_value(collision_tiles, i);
				
				var push_replacer = [0,0];
				switch(entity_class_lower){
					case "actor": 
						push_replacer =  entity_collision_compute_push(p, final_x_push, final_y_push); 
						break
						
					case "bullet": 
						if (bullet_collision_tile_action != "die"){
							push_replacer =  entity_collision_compute_push(p, final_x_push, final_y_push)
						};
						break
				}
					
				final_x_push = push_replacer[0];
				final_y_push = push_replacer[1];
			}
			
			x = final_x_push != INFINITY ? x + final_x_push : base_x;
			y = final_y_push != INFINITY ? y + final_y_push : base_y;
		}
	}
			
	if (
		(collision_solid_entities && collision_count_entities > 0) ||
		(collision_solid_tiles && collision_count_tiles > 0 ) 
		
	){
		move_steps_current = 0;
	}
}

collision_contact_y = "none";
collision_contact_x = "none";
		
if (collision_count_entities > 0 || collision_count_tiles > 0){
	if (sign(final_y_push) < 0){collision_contact_y = "bottom"}
	else if (sign(final_y_push) > 0){collision_contact_y = "top"}	
			
	if (sign(final_x_push) < 0){collision_contact_x = "right"}
	else if (sign(final_x_push) > 0){collision_contact_x = "left"}
}

if (collision_destroy_enabled && collision_impact_health_current <= 0){
	entity_damage_deal([id, status_health_current, true])
}

return [collision_count_entities, collision_count_tiles]