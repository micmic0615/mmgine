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
	
while(move_steps_current > 0){
	base_x = x;
	base_y = y;
			
	x = base_x + movement_x/move_steps_max;
	y = base_y + movement_y/move_steps_max;
			
	move_steps_current--;
			
	if (collision_compute){
		ds_list_clear(collision_entities_connect);
				
		var me = id;
		ds_list_clear(collision_entities_connect)
		ds_list_clear(collision_entities_valid);
				
		with(ENTITY){
			if (
				ACTIVE && ALIVE && id != me &&
				(
					(me.entity_class == "ACTOR" && me.collision_enabled_actors && collision_enabled_actors) ||
					(me.entity_class == "BULLET" && me.collision_enabled_bullets && collision_enabled_bullets) ||
					(me.entity_class == "DOODAD" && me.collision_enabled_doodads && collision_enabled_doodads) ||
					(entity_class == "ACTOR" && me.collision_enabled_actors && collision_enabled_actors) ||
					(entity_class == "BULLET" && me.collision_enabled_bullets && collision_enabled_bullets) ||
					(entity_class == "DOODAD" && me.collision_enabled_doodads && collision_enabled_doodads)
				)
			){
				var valid_faction = false;
				switch(collision_faction){
					case "all":
						if (me.collision_faction == "all"){
							valid_faction = true
						} else if (me.collision_faction == "ally" && player_faction == me.player_faction){
							valid_faction = true
						} else if (me.collision_faction == "enemy" && player_faction != me.player_faction){
							valid_faction = true
						}
						break
					case "ally":
						if (me.collision_faction == "all" && player_faction == me.player_faction){
							valid_faction = true
						} else if (me.collision_faction == "ally" && player_faction == me.player_faction){
							valid_faction = true
						}
						break
				
					case "enemy":
						if (me.collision_faction == "all" && player_faction != me.player_faction){
							valid_faction = true
						} else if (me.collision_faction == "enemy" && player_faction != me.player_faction){
							valid_faction = true
						}
						break
				}
						
				if (valid_faction){
					var not_exception = true;
					if (me.entity_class_lower == "bullet"){
						var is_exception = ds_list_find_index(me.collision_entities_exceptions, id);
						if (is_exception >= 0){not_exception = false}
					}
					
					if (not_exception){
						var checked_entity = id;
						with(me){ds_list_add(collision_entities_valid, checked_entity)};								
					}
				}
			}
		}
				
		for(var i = 0; i < ds_list_size(collision_entities_valid);i++){
			var p = ds_list_find_value(collision_entities_valid, i);
			if (place_meeting(x,y,p)){ds_list_add(collision_entities_connect, p)}
		}
		
		var collision_count_entities = ds_list_size(collision_entities_connect);
		for(var i = 0; i < collision_count_entities;i++){
			var p = ds_list_find_value(collision_entities_connect, i);
			var solid_collision = (collision_solid_entities && p.collision_solid_entities)
			if (solid_collision && collision_pushable){
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
			
		if (collision_solid_tiles){
			collision_count_tiles = entity_collision_check_tile(true);
			for(var i = 0; i < collision_count_tiles;i++){
				var p = ds_list_find_value(collision_tiles, i);
					
				var push_replacer = entity_collision_compute_push(p, final_x_push, final_y_push);
					
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
return [collision_count_entities, collision_count_tiles]