use <vendors/UtilitySCAD-R1/utility.scad>;
include <customizer.scad>;

$fa = 1;
$fs = 0.1;


nailhead_r = nailhead_diameter / 2;
nail_shaft_r = nail_shaft_width / 2 + 0.1;
border = 2;
box_width = 10;
box_length = 10;

module container_box(m = 0)
{
    m_2 = m * 2;
    total_l = box_length + m_2;
    echo("total thickness");
    echo(total_l);
    translate([-m,-m,0])
    {
        cube([box_width + m_2,total_l,nail_height + 1]);
    }
}

module nail_mold()
{
    translate([nailhead_r, nailhead_r, 0])
    {
        difference()
        {
            move_z(-1)
            {
                cylinder(nail_height + 1,nail_shaft_r,nail_shaft_r);

            }
            move_z(nailhead_height)
            {
                cylinder(0.2,nail_shaft_r,nail_shaft_r);
            }
        }

        move_z(-1)
        {
            cylinder(nailhead_height + 1,nailhead_r,nailhead_r);
        }
    }
}

difference()
{
    container_box();
    translate([1,1,0])
    {
        nail_mold();

    }
}