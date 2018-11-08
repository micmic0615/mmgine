var args = argument0;
var base_source = args[0];
var base_value = args[1];
var base_lethal = args[2];



var adjusted_args = entity_run_class_scripts("damage_take", [base_source, base_value, base_lethal]);

var adjusted_source = is_array(adjusted_args) ? adjusted_args[0] : base_source;
var adjusted_value = is_array(adjusted_args) ? adjusted_args[1] : base_value;
var adjusted_lethal = is_array(adjusted_args) ? adjusted_args[2] : base_lethal;

return [adjusted_source, adjusted_value, adjusted_lethal];