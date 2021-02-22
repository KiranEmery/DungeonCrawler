///INIT player

depth = 1000000;

d3d_start();
display_reset(0, true);
draw_set_color(c_white);

// stats
player_height = 32;

// movement
move_f = 0;
move_s = 0;
vsp = 0;
hsp = 0;
accel = 0.25;
maxspeed = 1.5;

// mouselook
xto = x+1;
yto = y;
zto = player_height;
zdir = 0;

// Controls
forward = ord("W");
back = ord("S");
left = ord("A");
right = ord("D");

//camsin / camcos
globalvar camsin;
globalvar camcos;
camsin = sin(direction*pi/180);
camcos = cos(direction*pi/180);

// Camera effects
d3d_set_lighting(true);

// lock mouse
mouseFree = false;
