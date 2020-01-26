global.WALL_RADIUS = 1020;
var ROOM_CIRCUMFERENCE = pi * global.WALL_RADIUS * 2;
var LADDER_WIDTH_PIXELS = 70;
global.LADDER_WIDTH = LADDER_WIDTH_PIXELS/ROOM_CIRCUMFERENCE * 360;
global.LEDGE_TOLERANCE = 5;
global.NIKO_HEIGHT = 127;

global.fast_mode = false;

global.RADIUS_INCREMENT = global.WALL_RADIUS/800;
global.CIRCUMFERENCE_INCREMENT = 100;
global.GRAVITY_FACTOR = global.WALL_RADIUS * 4;
global.JUMP_FACTOR = 5;

global.FALL_STUN_FACTOR = 10;

global.platforming_scene = true;