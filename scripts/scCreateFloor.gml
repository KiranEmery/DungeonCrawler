///scCreateFloor()
// Clear out the room (when changing floor and for testing) 
instance_destroy(oWall);

// resetting position of level creator
x = 640;
y = 640;

// Fill the room with walls
for (i = 0; i <= room_width div TILE_SIZE; i++)
{
    for (j = 0; j <= room_height div TILE_SIZE; j++)
    {
        instance_create(i * TILE_SIZE, j * TILE_SIZE,oWall)
    }
}

dir = 0

var roomSize = choose(1000,1500,2000);
repeat(roomSize)
{
    dir = choose(0,1,2,3) * 90; // randomly choose a direction
    
    // delete the block we are on 
    object = instance_position(x,y,oWall);
    instance_destroy(object);
    
    // move to anothe random tile
    x += lengthdir_x(TILE_SIZE,dir);
    y += lengthdir_y(TILE_SIZE,dir);
    
    x = clamp(x,0 + TILE_SIZE ,room_width - (TILE_SIZE * 2))
    y = clamp(y,0 + TILE_SIZE,room_height - (TILE_SIZE * 2))
    
    // delete the block we end on and a square around it - easier for player positioning
    object = instance_position(x,y,oWall);
    instance_destroy(object);
    
}

// Set player to the start of the floor
oPlayer.x = 640;
oPlayer.y = 640;


