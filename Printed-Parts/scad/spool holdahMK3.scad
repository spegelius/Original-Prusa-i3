// PRUSA iteration3
// Spool holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/include.scad>;

module dxf_holder(){
   linear_extrude(height = 8, center = true, convexity = 5)
   import (file = "spool holdahMK3.dxf", layer = "0");
}

module spool_holder_left() {
    difference() {
        union() {
            dxf_holder();
            translate([51.53-3.5,123-5-3.5,-4])
            cylinder(h=8, d=38);
        }
        translate([51.53-3.5,123-5-3.5,-5])
        hull() {
            cylinder(d=29,h=10,$fn=40);
            translate([6,15,0])
            cylinder(d=29,h=10,$fn=40);
        }

        translate([51.53-3.5,123-5-3.5,0])
        rotate([0,0,-23])
        cube([1,80,10],center=true);
    }
}

module spool_holder_left_dollo() {
    difference() {
        union() {
            spool_holder_left();

            hull() {
                translate([3,-30,-4])
                chamfered_cube_side(30,38,8,2);

                translate([11,20,-4])
                cube([1,2,8]);
            }
        }
        translate([-6,-30,-5])
        cube([30,30,10]);
        
        translate([-9,-50,-5])
        cube([30,30,10]);
        
        translate([15-6,0,-5])
        male_dovetail();

        translate([-6+30,-15,-5])
        rotate([0,0,-90])
        male_dovetail();
    }
}

module spool_holder_right() {
    mirror([1,0,0])
    spool_holder_left();
}

module spool_holder_right_dollo() {
    mirror([1,0,0])
    spool_holder_left_dollo();
}

translate([-1,92,0])
rotate([0,0,143])
spool_holder_right();

spool_holder_left();

// Dollo frame holders
//translate([-16,105,0])
//rotate([0,0,152])
//spool_holder_right_dollo();
//spool_holder_left_dollo();
