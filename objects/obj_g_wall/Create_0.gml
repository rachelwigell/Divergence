event_inherited();

// list of all the ladders in the room
ladder_locations = array_create(1);
// an individual ladder
ladder0 = declare_ladder(270, 250, global.WALL_RADIUS);
ladder_locations[0] = ladder0;

// list of all the ledges in the room
ledge_locations = array_create(1);
// an individual ledge
ledge0 = declare_ledge(250, 180, 270);
ledge_locations[0] = ledge0;