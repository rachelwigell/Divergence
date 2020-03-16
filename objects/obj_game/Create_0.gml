global.WALL_RADIUS = 4000;
var ROOM_CIRCUMFERENCE = pi * global.WALL_RADIUS * 2;
var LADDER_WIDTH_PIXELS = 70;
global.LADDER_WIDTH = LADDER_WIDTH_PIXELS/ROOM_CIRCUMFERENCE * 360;
global.NIKO_HEIGHT = 128;

global.freeze_movement = false;
global.fast_mode = false;

global.LADDER_SPEED = global.NIKO_HEIGHT/30;
global.CIRCUMFERENCE_INCREMENT = global.NIKO_HEIGHT*2;
global.GRAVITY_FACTOR = 8000;
global.JUMP_FACTOR = global.NIKO_HEIGHT/12;
global.MAX_JUMP_CHARGE = 10;
global.FALL_STUN_FACTOR = 10;