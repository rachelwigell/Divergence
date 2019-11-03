global.WALL_RADIUS = 1005;
global.MAX_RADIUS = global.WALL_RADIUS + global.WALL_RADIUS/6;
var room_circumference = pi * global.WALL_RADIUS * 2;
var ladder_width_pixels = 80;
global.LADDER_WIDTH = ladder_width_pixels/room_circumference * 360;
global.LEDGE_TOLERANCE = 5;