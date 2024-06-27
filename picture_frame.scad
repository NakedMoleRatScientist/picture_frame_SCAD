 /* Parametric Picture Frame © 2023 by NMR_scientist is licensed under CC BY 4.0. To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/
 
This model is published at this  [URL](https://www.printables.com/model/649297).

Version: R1
Title: Picture Frame
Description: Parametric picture frame that I used for holding a picture protected by an acrlyic panel.

History:

*/

$fa = 1;
$fs = 0.1;
use <vendors/UtilitySCAD-R1/utility.scad>;
use <vendors/UtilitySCAD-R1/hooks.scad>;
use <nail_box.scad>;
include <customizer.scad>;

picture_w = width;
picture_h = height;
picture_l = length;

m_2 = m * 2;

echo("Initial frame dimension");
frame_w = picture_w + frame_border * 2;
echo("frame width");
echo(frame_w);
frame_l = picture_l + frame_border * 2 + border;
echo("frame length");
echo(frame_l);
frame_h = picture_h + frame_border * 2;
echo("frame height");
echo(frame_h);

//Where the picture resides. 
module inside_slot()
{
    translate([frame_border,frame_border,frame_border])
    {   
        move_by_margin(m);
        {
            cube([width + m_2,length + m_2,height + m_2]);
        }
    }
}

//Slot for an acrylic pane.
module acrylic_slot()
{
    y = 2;
    translate([frame_border,y,frame_border])
    {   
        move_by_margin(m);
        {
            cube([picture_w + m_2,1 + m_2,picture_h + m_2]);
        }
    }
}


module picture_frame_cutout()
{
        translate([frame_border + border,-1,frame_border + border])
        {
            cube([width - border * 2,frame_border + 1,height - border]);
        }
}

module frame()
{
    difference()
    {
        cube([frame_w,frame_l,frame_h]);
        color("red")
        {
           inside_slot();
        }
        color("blue")
        {
            acrylic_slot();
        }
        picture_frame_cutout();
    }
}

module frame_top_interface()
{
    cutoff = frame_border + height;
    difference()
    {
        children();
        translate([-1,-1,cutoff])
        {
           cube([frame_w + 2,frame_l + 2,frame_h + 1]);
           
        }
        translate([0,frame_l - 2,cutoff - 16])
        {
            if (add_hook == true)
            {
                circular_hook(nailhead_diameter,frame_w,nail_shaft_width);   
            }
        }


    }
    shadow_line(cutoff - 1);
    friction_slot(cutoff - 1,0);
}



module friction_slot(height, slot_m = 0)
{
    slot_m_2 = slot_m * 2;
    translate([frame_border,frame_border + border+ m_2,height])
    {
        size = [2,frame_border + border - m_2,2];
        
        castellate(picture_w + m_2,size,slot_m);        
    }
}

module shadow_line(height)
{
    shadow_line = 1;
    cut = 0.1;
    translate([-cut,-cut,height])
    {
        cube([shadow_line + cut,frame_l + cut,2]);
    }
    translate([frame_w - shadow_line,-cut,height])
    {
        cube([shadow_line + cut,frame_l + cut,2]);
    }
    translate([0,frame_l - shadow_line,height])
    {
        cube([frame_w,shadow_line + cut,2]);
    }
}

module frame_top()
{
    rotate([0,180,0])
    {
        difference()
        {
            z_cut = frame_h - frame_border;
            hor_cut(frame_w,frame_l,z_cut)
            {
                frame();   
            }           
            h = -1;
            shadow_line(h);
            color("blue")
            {
                friction_slot(h,-0.1);
            }
        }
    }
}

frame_top_interface()
{
    difference()
    {
        frame();
        center(nailhead_diameter,frame_w)
        {
            translate([0,8.5,0])
            {
                if (include_nail == true)
                {
                    nail_mold();
                }
            }
        }
    }
}

//Create the top.
translate([frame_w,-frame_l - 5,frame_border])
{
    frame_top();
}
