var modulo = argument0;

var floor_age = floor(ROOM.room_age_game);
var next_floor_age = floor(ROOM.room_age_game + TIMESPEED);

return (floor_age != next_floor_age && floor_age % modulo == 0)