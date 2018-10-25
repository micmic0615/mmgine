var p = argument0;

var final_x_push = argument1;
var final_y_push = argument2;
					
var right_push = 0;
var left_push = 0;
var bottom_push = 0;
var top_push = 0;
					
var x_push = 0;
var y_push = 0;
					
var x_bias = 1;
var y_bias = 1;

var bias_growth = 5;
					
while (place_meeting(x + x_bias,y,p)){x_bias += bias_growth}	
while (!place_meeting(x + x_bias,y,p)){x_bias -= 1}	
right_push = x_bias;
					
x_bias = -1;
					
while (place_meeting(x + x_bias,y,p)){x_bias -= bias_growth}		
while (!place_meeting(x + x_bias,y,p)){x_bias += 1}		
left_push = x_bias;
					
x_push = abs(right_push) > abs(left_push) ? left_push : right_push;
					
while (place_meeting(x,(y + y_bias),p)){y_bias += bias_growth}	
while (!place_meeting(x,(y + y_bias),p)){y_bias -= 1}	
bottom_push = y_bias;
					
y_bias = -1;
					
while (place_meeting(x,(y + y_bias),p)){y_bias -= bias_growth}		
while (!place_meeting(x,(y + y_bias),p)){y_bias += 1}	
top_push = y_bias;
					
y_push = abs(bottom_push) > abs(top_push) ? top_push : bottom_push;
				
if (abs(x_push) < abs(y_push)){
	
	if (sign(final_x_push) == sign(x_push)){
		final_x_push = abs(x_push) > abs(final_x_push) ? x_push : final_x_push;
	} else {
		final_x_push = final_x_push == 0 ? x_push : INFINITY
	}
} else {
	
	if (sign(final_y_push) == sign(y_push)){
		final_y_push = abs(y_push) > abs(final_y_push) ? y_push : final_y_push;
	} else {
		final_y_push = final_y_push == 0 ? y_push : INFINITY
	}
}

return [final_x_push, final_y_push]