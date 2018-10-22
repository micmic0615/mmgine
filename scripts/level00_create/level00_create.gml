spawner = 120;

while(spawner > 0){
	instance_create_depth(random(1000), (random(300)*-1 + -100), 1,Enemy)
	spawner -= 1;
}

