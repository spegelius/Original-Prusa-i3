// PRUSA iteration3
// RAMBo cover hinges
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/include.scad>;

module upper_hinge(hole=true) {
    difference() {
        union() {
            // body
            cylinder( h = 26, r = 2.4, $fn=30);
            translate([0,0,26]) cylinder( h = 2, r1 = 2.4, r2 = 1.8, $fn=30);
            translate( [ -5 , -11 , 0 ] ) cube( [ 7 , 11 , 21 ] );
        }
        if (hole) {
            // M3 screw hole
            translate( [ -12.5 , -2.5 , 17 ] ) rotate( [0,90,0] ) cylinder( h = 20, r = 1.75, $fn=30);
            translate( [ -1.5 , -2.5 , 17 ] ) rotate( [0,90,0] ) cylinder( h = 9, r = 3, $fn=30);
        }
        // angle cut
        translate([-2.9,-20,-1]) rotate([0,0,60]) cube([25,5,26]);
    }
}

module lower_hinge(hole=true) {
    difference() {   
        union(){ 
            // body   
            translate( [ 0 , 6 , 0 ] ) cylinder( h = 15, r = 2.4, $fn=30);
            translate( [ 0 , 6 , 0 ] ) cylinder( h = 10, r = 2.8, $fn=30);
            translate( [ 0 , 6 , 15 ] ) cylinder( h = 2, r1 = 2.4, r2=1.8, $fn=30);
            translate( [ -5 , 4 , 0 ] ) cube( [ 7 , 13 , 10 ] );
        }
        if (hole) {
            // M3 screw
            translate( [ -0.5 , 8.5 , 4 ] ) rotate( [0,90,0] ) cylinder( h = 20, r = 3, $fn=30);
            translate( [ -12 , 8.5 , 4 ] ) rotate( [0,90,0] ) cylinder( h = 20, r = 1.75, $fn=30);
        }
        // angle cut
        translate([-5,20,-1]) rotate([0,0,-60]) cube([20,5,20]);
    }
}

module dollo_upper_hinge() {
    difference() {
        union() {
            chamfered_cube(30+16,30,10,1.5,center=true);
            translate([0,30/2-2,0]) chamfered_cube(52,9,10,1.5,center=true);
            //translate([-0.75,30/2,0]) cube([29.4,4,10],center=true);
            translate([-50/2+3-2.5,20,-16]) rotate([0,0,90]) upper_hinge(hole=false);
        }
        translate([0,-5,0]) cube([30,30,12],center=true);
        translate([-15,-5,-20/2]) rotate([0,0,90]) male_dovetail(20);
        translate([15,-5,-20/2]) rotate([0,0,-90]) male_dovetail(20);
        
        translate([50/2-4,18,0]) rotate([90,0,0]) cylinder(d=2.8,h=10,$fn=20);
        
        translate([0,0,-12/2-5]) cube([60,60,12],center=true);
        
        translate([25.9,17.5,0]) cube([20,5,12],center=true);
    }
}

module dollo_lower_hinge() {
    intersection() {
        difference() {
            union() {
                chamfered_cube(15,10,50,1.5,center=true);
                translate([0,0,-50/2+2/2]) chamfered_cube_side(20,14,2,1.5,center=true);
                translate([0,0,50/2-5]) hull() {
                    translate([-0.5,0,0]) chamfered_cube(52,10,12,1.5,center=true);
                    translate([0,0,-20]) chamfered_cube(15,10,10,1.5,center=true);
                }
                translate([-30.5,-7,16]) rotate([0,0,-90]) lower_hinge(hole=false);
            }
            translate([0,3.001,-60/2]) rotate([0,0,180]) male_dovetail(60);
            translate([15.9,-2-5,12.9]) cube([13,5,25]);
            
            translate([50/2-4,5,50/2-4]) rotate([90,0,0]) cylinder(d=3,h=10,$fn=20);
            translate([50/2-4,3.3,50/2-4]) rotate([90,30,0]) nut(3, cone=false);
            
            translate([-70/2,-5,16]) rotate([45,0,0]) translate([0,-5,0]) cube([70,5,10]);
            
            translate([10.5,0,8]) rotate([0,45,0]) cube([6,25,6], center=true);
            translate([-10.5,0,8]) rotate([0,45,0]) cube([6,25,6], center=true);
            
            translate([10.5,0,19]) rotate([0,45,0]) cube([6,25,6], center=true);
            translate([-10.5,0,19]) rotate([0,45,0]) cube([6,25,6], center=true);


        }
        translate([0,-7,0]) cube([100,20,70],center=true);
    }
}

//upper_hinge();
//lower_hinge();

//ollo_upper_hinge();
dollo_lower_hinge();
