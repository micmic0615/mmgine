if (ACTIVE && ALIVE){
	var me = id;
	seekingbullet_push_cooldown_timer -= TIMESPEED;
	seekingbullet_hit_take_cooldown_timer -= TIMESPEED;
	
	image_xscale = 1 + seekingbullet_hit_take_size*(seekingbullet_hit_take_current/seekingbullet_hit_take_max);
	image_yscale = 1 + seekingbullet_hit_take_size*(seekingbullet_hit_take_current/seekingbullet_hit_take_max);
	
	if (seekingbullet_push_cooldown_timer <= 0){
		with(SeekingBullet){
			if (ACTIVE && ALIVE && id != me){
				var push_factor = sprite_width*image_xscale*0.4;
				if (distance_between(x,y,me.x,me.y) < push_factor){
					var angle = angle_between(x,y,me.x,me.y)
					entity_motion_push(push_factor*0.5, 0.5*SEC, angle, ["multiply",1.25]);
					me.seekingbullet_push_cooldown_timer = me.seekingbullet_push_cooldown_value
				}
			}
		}
	}
}

