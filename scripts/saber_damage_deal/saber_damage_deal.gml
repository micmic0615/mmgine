var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

if (damage_id == "main_attack"){
	ds_list_clear(physics_motion_list);
	var rebound_angle = angle_between(x,y, base_target.x,base_target.y);
	entity_motion_push(440, 0.5*SEC, rebound_angle, ["multiply",1.25])
	my_chase_jump_mirage_timer = 0;
}
