var angle_original = angle_clean(argument0);
var angle_target = angle_clean(argument1);
var angle_delta = argument2;

if (angle_target - angle_original > 180){angle_target -= 360}
if (angle_original - angle_target > 180){angle_original -= 360}

if (angle_original - angle_target > angle_delta){
	angle_original -= angle_delta
} else if (angle_original - angle_target < -1*angle_delta){
	angle_original += angle_delta
}

return angle_clean(angle_original);