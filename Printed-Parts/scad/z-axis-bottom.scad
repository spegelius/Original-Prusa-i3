// PRUSA iteration3
// Z axis bottom holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/mockups.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;

module z_bottom_base(){
 translate([0,-1.5,0]) cube([8,49,16+25]); // plate touching the base
 translate([0,-5,0]) cube([30,4.01,22]); // plate touching the base
 translate([0,41.5,0]) cube([30,6.01,22]); // plate touching the base
 translate([0,-5,0]) cube([50,52.5,5]); // plate touching the base
}

module z_bottom_fancy(){
    // corner cutouts
    translate([0.5,-2.5,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
    translate([0.5,40-0.5+5,0]) rotate([0,0,-45+90]) translate([-15,0,-1]) cube([30,30,51]);
 
    translate([8,0,12+20+6]) rotate([0,-90,0]) translate([0,-5,0]) cube([30,50,30]);
    translate([20,-2,12+8]) rotate([45,0,0]) rotate([0,-90,0]) translate([0,-5,0]) cube([30,50,30]);
    translate([25,20,12+30]) rotate([-45,0,0]) rotate([0,-90,0]) translate([0,-5,0]) cube([30,50,30]);
    translate([50-2.5,-5+2.5+67,0]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
    translate([50-2.5,-5+2.5,0]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
 
    // Stiffner cut out
    translate([30,0,5.5]) rotate([0,-45,0]) translate([0,-5,0]) cube([30,60,30]);
}

module z_bottom_holes(){
    // Frame mounting screw holes
    translate([-1,10,10+5]) rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);
    translate([-1,10+20,10+5]) rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);
    translate([-1,10+10,10+20+5]) rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);

    // Frame mounting screw head holes
    translate([4,10,10+5]) rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10+20,10+5]) rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10+10,10+20+5]) rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10+10-3.1,10+20+5]) cube([10,6.2,10]);

    // Z rod holder
    translate([25+4.3,3,-1]) rotate([0,0,0]) cylinder(h = 50, r=4.125, $fn=15);
    translate([25+4.3,3,-1]) rotate([0,0,0]) cylinder(h = 1.6, r1=5, r2=4.125, $fn=15);
    translate([25+4.3-1,3,0.6]) cube([2,10,7]); // it's bit up because it helps with printing

    // motor mounting
    translate([25+4.3,20,-1]){

    translate([15.5,15.5,-1]) cylinder(h = 20, r=1.8, $fn=30);
    translate([15.5,-15.5,-1]) cylinder(h = 20, r=1.8, $fn=30);
    translate([-15.5,15.5,-1]) cylinder(h = 20, r=1.8, $fn=30);
    translate([-15.5,-15.5,-1]) cylinder(h = 20, r=1.8, $fn=30);

    translate([0,0,-1]) cylinder(h = 20, r=12, $fn=30);
 }

}

module z_bottom_right(){
    difference(){
        z_bottom_base();
        z_bottom_fancy();
        z_bottom_holes();
    }
}

module z_bottom_left(){
 translate([0,-13,0]) mirror([0,1,0]) 
    difference(){
        z_bottom_base();
        z_bottom_fancy();
        z_bottom_holes();
 }
}

module dollo_z_bottom_right(coupler=false) {
    difference() {
        union() {
            z_bottom_right();
            //translate([-22.3,-3,0]) cube([30.3,46,40]);
            translate([-22.3,-3,0]) chamfered_cube(30.3,46,40,2);
            translate([-20,2,0]) chamfered_cylinder(10,40,2,$fn=50);
            translate([-20,38,0]) chamfered_cylinder(10,40,2,$fn=50);
        }
        translate([-32.3,5,-1]) cube([30,30,60]);
        translate([-2.3,20,-1]) rotate([0,0,-90]) male_dovetail(50);
        translate([-17.3,35,-1]) rotate([0,0,0]) male_dovetail(50);
        translate([-17.3,5,-1]) rotate([0,0,180]) male_dovetail(50);

        if (coupler) {
            translate([-6,34,39.5]) rotate([-45,0,0]) cube([7.4,30,40],center=true);
            translate([-20,34,51.5]) cube([21,30,40],center=true);
        } else {
            translate([-6,34,52.5]) rotate([-45,0,0]) cube([7.4,30,40],center=true);
        }
    }

    %translate([29,-1,25]) rotate([-90,0,0]) mock_stepper_motor();
    if (coupler) {
        %translate([29,20,-30]) cylinder(d=19,h=25,$fn=40);
    }
    %translate([25+4.3,20,0]) rotate([0,180,0]) dollo_z_coupler_rod_riser_right();
}

module dollo_z_bottom_left(coupler=false) {
    translate([0,-13,0]) mirror([0,1,0]) dollo_z_bottom_right(coupler=coupler);
}

module dollo_z_coupler_rod_riser_right() {
    difference() {
        union() {
            translate([0,0,23/2]) rounded_cube_side(42,42,23,3,center=true);
            translate([0,-17,0]) cylinder(d=13,h=28,$fn=20);
        }

        translate([0,-17,-0.01]) cylinder(h = 5, r=4.125, $fn=15);
        translate([0,-17,4.98]) cylinder(h = 5, r1=4.125, r2=2.125, $fn=15);

        translate([15.5,15.5,-1]) cylinder(h = 40, r=1.8, $fn=30);
        translate([15.5,-15.5,-1]) cylinder(h = 40, r=1.8, $fn=30);
        translate([-15.5,15.5,-1]) cylinder(h = 40, r=1.8, $fn=30);
        translate([-15.5,-15.5,-1]) cylinder(h = 40, r=1.8, $fn=30);

        translate([15.5,15.5,2]) cylinder(h = 40, r=3.3, $fn=30);
        translate([15.5,-15.5,2]) cylinder(h = 40, r=3.3, $fn=30);
        translate([-15.5,15.5,2]) cylinder(h = 40, r=3.3, $fn=30);
        translate([-15.5,-15.5,2]) cylinder(h = 40, r=3.3, $fn=30);

        translate([0,0,-1]) cylinder(h = 40, d=24,$fn=30);
        translate([0,-17,23]) cylinder(h = 6, r=4.125, $fn=15);
        translate([0,-17,9]) cylinder(h = 19, r=2.125, $fn=15);

        translate([0,-17,29-8/2]) cube([2,15,8],center=true);

        translate([25.15,0,18]) rotate([0,58,0]) cube([40,50,20],center=true);
        translate([-25.15,0,18]) rotate([0,-58,0]) cube([40,50,20],center=true);

        translate([10,20,18]) rotate([-35,0,0]) cube([40,50,20],center=true);

        translate([-30,-11,-0.1]) cube([30,40,42]);
        translate([-3,0,-0.1]) cube([14,30,42]);
    }

    cylinder(h = 9.8, r=4.075, $fn=15);
}

module dollo_z_coupler_rod_riser_left() {
    mirror([0,1,0]) dollo_z_coupler_rod_riser_right();
}

// opriginal
//z_bottom_right();
//z_bottom_left();

// no z coupler
//dollo_z_bottom_right(false);
//dollo_z_bottom_left(false);

// with z coupler
dollo_z_bottom_right(true);
//dollo_z_bottom_left(true);

// risers to use with couplers
//dollo_z_coupler_rod_riser_right();
//dollo_z_coupler_rod_riser_left();
