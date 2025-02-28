 /* Acrylic Pane for Parametric Picture Frame © 2023 by NMR_scientist is licensed under CC BY 4.0. To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/

This model is published at this  [URL](https://www.printables.com/model/649297).

Version: R1
Title: Acrylic Pane for Parametric Picture Frame
Description: Laser cut acrlyic pane for transparent protection of the actual picture you want to display. 

History:

*/
$fa = 1;
$fs = 0.1;

use <vendors/UtilitySCAD-R1/utility.scad>;
include <customizer.scad>;

r = 1;
hull_r = r * 2;
// The reason why we don't just use width and height is that we can't expect the dimension to be the same when using the corner module with the hull function.
final_w = width - hull_r;
final_l = height - hull_r;
echo(final_l);
module corner()
{
    cylinder(1,r,r);
}


projection()
{
    hull()
    {
        translate([r,r,0])
        {
            corner();
            move_x(final_w)
            {
                corner();
                move_y(final_l)
                    corner();
            }
            move_y(final_l)
                corner();
        }
    }
}