/// Movement 
//gain speed
move_f += keyboard_check(forward) * accel;
move_f -= keyboard_check(back) * accel;
move_s += keyboard_check(left) * accel;
move_s -= keyboard_check(right) * accel;

//cap speed at max
move_f = clamp(move_f, -maxspeed, maxspeed);
move_s = clamp(move_s, -maxspeed, maxspeed);

//slow down
if (!keyboard_check(forward) && !keyboard_check(back) && move_f != 0)
    move_f -= accel * sign(move_f);
if (!keyboard_check(left) && !keyboard_check(right) && move_s != 0)
    move_s -= accel * sign(move_s);

//Apply movement
hsp = lengthdir_x(move_f, direction) + lengthdir_x(move_s, direction+90);
vsp = lengthdir_y(move_f, direction) + lengthdir_y(move_s, direction+90);

// Collisions
// Horizontal collision
if place_meeting(x+hsp,y,oWall)
    {
    while (!place_meeting(x+sign(hsp),y,oWall))
        {
        x += sign(hsp)
        }
        hsp = 0
    }
x += hsp;

// Vertical Colision
if place_meeting(x,y+vsp,oWall)
    {
    while (!place_meeting(x,y+sign(vsp),oWall))
        {
        y += sign(vsp)
        }
    vsp = 0  
    }
y += vsp;

// Player gives off light
d3d_light_define_point(1, x, y, player_height / 2, 140, c_white);
d3d_light_enable(1,true);

// Mouse Look
if (!mouseFree)
{
window_set_cursor(cr_none);
direction -= (display_mouse_get_x() - display_get_width()/2) / 8;
zdir -= (display_mouse_get_y() - display_get_height()/2) / 10;

//clamp zdir
var ztomax = 70;
zdir = clamp(zdir, -ztomax, ztomax);

//set xto and yto
var d = degtorad(direction);
var zd = degtorad(zdir);
xto = x + cos(d) * abs(sin(zd) + sign(-zdir));
yto = y - sin(d) * abs(sin(zd) + sign(-zdir));
zto = (player_height) + sin(zd);

//reset mouse position
var centerx = display_get_width()/2;
var centery = display_get_height()/2;
display_mouse_set(centerx, centery);
} else
{
 window_set_cursor(cr_arrow);
}

