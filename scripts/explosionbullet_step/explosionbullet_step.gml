if (explosion_lifespan_current > 0){
	var explosion_life_ratio = sqr(explosion_lifespan_current/explosion_lifespan_base)
	var explosion_size = explosion_radius_min + ((1 - explosion_life_ratio) * (explosion_radius_max - explosion_radius_min));
	
	image_xscale = (explosion_size*2)/sprite_get_width(sprite_index);
	image_yscale = (explosion_size*2)/sprite_get_height(sprite_index);
	
	image_alpha = explosion_lifespan_current/explosion_lifespan_base;
	
	explosion_lifespan_current -= TIMESPEED;
	if (explosion_lifespan_current <= TIMESPEED){status_health_current = 0}
	bullet_lifespan = explosion_lifespan_current;
} 
