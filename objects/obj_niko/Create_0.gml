global.WALL_RADIUS = 1005;
global.ROOM_WIDTH = 2500;
global.ROOM_HEIGHT = 2500;
room_circumference = pi * global.WALL_RADIUS * 2;
ladder_width_pixels = 80;
global.LADDER_WIDTH = ladder_width_pixels/room_circumference * 360;
global.LEDGE_TOLERANCE = 5;

pos_angle = 270;
pos_radius = global.WALL_RADIUS;
vel_radius = 0;
vel_angle = 0;
on_floor = true;
obj_depth = 0;
on_ladder = false;
on_ledge = false;