// PRUSA iteration3
// Y idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/include.scad>;

module y_idler_base(){
 translate(v = [0,0,0]) cylinder(h = 19, r=8);	
 translate(v = [0,20,0]) cylinder(h = 19, r=8);
 translate(v = [0,10,9.5]) cube(size = [16,20,19], center=true);
 translate(v = [-4,10,9.5]) cube(size = [8,16+20,19], center=true);
}

module y_idler_holes(){
 translate(v = [0,0,-1]) cylinder(h = 120, r=1.8);	
 translate(v = [0,20,-1]) cylinder(h = 25, r=4.5);
 translate(v = [0,0,4]) cylinder(h = 11, r=12);
}

// Final part
module y_idler(){
 translate(v = [0,0,8])rotate([0,-90,0]) difference(){
  y_idler_base();
  y_idler_holes();
 }
}

module dollo_y_idler_body() {
    rotate([0,-90,0]) difference() {
        union() {
            translate([0,2,-30]) cube([28,40,46]);
            hull() {
                translate([0,2,-5]) cube([28,40,21]);
                translate([0,0,8]) rotate([0,90,0]) cylinder(d=16,h=28,$fn=40);
            }
            translate([0,42,-25]) rotate([0,90,0]) cylinder(d=10,h=28,$fn=50);
            translate([0,42,11]) rotate([0,90,0]) cylinder(d=10,h=28,$fn=50);

            translate([0,22,23]) rotate([0,90,0]) hull() {
                translate([0,-2,0]) cylinder(d=4,h=28,$fn=30);
                translate([0,2,0]) cylinder(d=4,h=28,$fn=30);
                translate([7,-8,0]) cube([1,12,28]);
            }
            //%translate([23.5,0,8]) rotate([90,180,0]) dollo_y_idler_arm();
        }
        hull() {
            translate([4.2,4,12]) rotate([0,90,0]) cylinder(d=22,h=19.6,$fn=50);
            translate([4.2,4,8]) rotate([0,90,0]) cylinder(d=22,h=19.6,$fn=50);
            translate([4.2,4,-5]) rotate([0,90,0]) cylinder(d=19,h=19.6,$fn=50);
        }
        translate([4.2,-11,-40]) cube([19.6,22,60]);
        translate([-1,21,-22]) cube([30,40,30]);
        translate([-1,6,-38]) rotate([45,0,0]) cube([30,10,30]);

        translate([0,40/2,23.2]) rotate([0,45,0]) cube([10,40,20],center=true);
        translate([28,40/2,23.2]) rotate([0,-45,0]) cube([10,40,20],center=true);

        translate([-1,36,-22]) rotate([-90,0,-90]) male_dovetail(30);
        translate([-1,36,8]) rotate([90,0,90]) male_dovetail(30);
        translate([-1,21.01,-7]) rotate([90,-90,90]) male_dovetail(30);

        // bolt holes
        translate([-0.5,0,8]) rotate([0,90,0]) hull() {
            cylinder(d=3.5,h=40,$fn=20);
            translate([0,4,0]) cylinder(d=3.5,h=40,$fn=20);
        }

        translate([-.5,6,-11]) rotate([0,90,0]) hull() {
            cylinder(d=3.3,h=40,$fn=20);
            translate([3,0,0]) cylinder(d=3.3,h=40,$fn=20);
        }

        translate([28/2,12,21.5]) rotate([-90,0,0]) hull() {
            cylinder(d=3.3,h=20,$fn=20);
            translate([0,0.5,0]) cylinder(d=3.3,h=20,$fn=20);
        }
    }
}

module dollo_y_idler_arm() {
    difference() {
        union() {
            rotate([0,90,0]) hull() {
                cylinder(d=16,h=19,$fn=40);
                translate([6,-7,0]) cylinder(d=8,h=19,$fn=30);
                translate([6,9,0]) cylinder(d=8,h=19,$fn=30);
            }

            translate([0,0,-6]) rotate([0,90,0]) hull() {
                translate([-2,-16,0]) cylinder(d=4,h=19,$fn=30);
                translate([2,-16,0]) cylinder(d=4,h=19,$fn=30);
                translate([-2,22,0]) cylinder(d=4,h=19,$fn=30);
                translate([2,22,0]) cylinder(d=4,h=19,$fn=30);
            }

        }
        translate([4,0,0]) rotate([0,90,0]) cylinder(d=22,h=11,$fn=50);
        translate([-0.1,0,0]) rotate([0,90,0]) cylinder(d=3.5,h=21,$fn=20);
        translate([19/2,-13.5,-11]) cylinder(d=3.3,h=10,$fn=20);
        translate([19/2,-13.5,-5]) nut(3);
        translate([-0.1,20,-6]) rotate([0,90,0]) cylinder(d=3.3,h=21,$fn=20);
    }
}


//y_idler();
dollo_y_idler_body();
//dollo_y_idler_arm();