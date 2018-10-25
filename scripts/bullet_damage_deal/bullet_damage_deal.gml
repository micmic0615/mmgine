var args = argument0;

var base_target = args[0];
var base_value = args[1];
var base_lethal = args[2];

var adjusted_args = entity_run_type_scripts("damage_deal", args);

var adjusted_target = is_array(adjusted_args) ? adjusted_args[0] : base_target;
var adjusted_value = is_array(adjusted_args) ? adjusted_args[1] : base_value;
var adjusted_lethal = is_array(adjusted_args) ? adjusted_args[1] : base_lethal;

return [adjusted_target, adjusted_value, adjusted_lethal];