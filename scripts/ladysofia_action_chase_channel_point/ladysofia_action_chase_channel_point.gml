physics_gravity_current = 0;
my_chase_random = random(100);

if (my_chase_random > 50){
	action_shoot_trigger([action_chase[?"target_entity"].x,action_chase[?"target_entity"].y]);
} else {
	action_barrage_trigger(action_chase[?"target_entity"]);
}


