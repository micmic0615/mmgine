var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];
var damage_id = args[3];

if (damage_id == "main_attack" && base_value == status_damage_total*my_charge_factor_damage){
	my_frenzy_timer = my_frenzy_value;
}