event_inherited();

// list of all the ladders in the room
ladder_locations = array_create(1);
// an individual ladder
ladder0 = declare_ladder(270, 1188, global.WALL_RADIUS);
ladder_locations[0] = ladder0;
//ladder1 = declare_ladder(90, 240, global.WALL_RADIUS);
//ladder_locations[1] = ladder1;

// list of all the ledges in the room
ledge_locations = array_create(1);
// an individual ledge
ledge0 = declare_ledge(1188, 180, 270);
ledge_locations[0] = ledge0;
ledge1 = declare_ledge(3120, 0, 90);
ledge_locations[1] = ledge1;