/* Public domain, for your own use. */
use <utility.scad>;

cube2 = [2,2,2];
d = 20;
cube([d,2,2]);
move_z(2)
    castellate(d,cube2);

move_y(4)
{
    cube3 = [4,2,2];
    d = 19;
    cube([d,2,2]);
    move_z(2)
    castellate(d,cube3);
}
