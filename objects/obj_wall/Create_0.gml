x = global.ROOM_WIDTH/2;
y = global.ROOM_WIDTH/2;
depth = 2;

// list of all the ladders in the room
ladder_locations = array_create(1);
// an individual ladder
// first element is angle of location
// second element is radius of top
// third element is radius of bottom
ladder0 = array_create(3);
ladder0[0] = 270;
ladder0[1] = 250;
ladder0[2] = global.WALL_RADIUS;
ladder_locations[0] = ladder0;

// list of all the ledges in the room
ledge_locations = array_create(1);
// an individual ledge
// first element is radius of location
// second element is left-edge angle
// third element is right-edge angle
ledge0 = array_create(3);
ledge0[0] = 250;
ledge0[1] = 180;
ledge0[2] = 270;
ledge_locations[0] = ledge0;
