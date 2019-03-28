var unit = argument_count > 0 ? argument[0] : id;
return (is_real(unit) && instance_exists(unit) && unit.alive && unit.active)