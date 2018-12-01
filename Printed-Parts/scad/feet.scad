
use <../../Dollo/NEW_long_ties/include.scad>;
include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/corner.scad>;

module _bottom_hole() {
    union() {
        translate([0,0,-0.1]) cylinder(d=6-1, h=3, $fn=20);
        translate([0,0,2]) sphere(d=6, $fn=20);
    }
}

module corner_foot() {
    difference() {
        translate([-7.5,7.5,32/2]) rounded_cube_side(44.9,44.9,32,4,center=true);
        translate([-12.1,12.1,40/2+10]) rotate([0,0,-45]) cube([40,120,40],center=true);

        translate([20,-20,20]) rotate([0,-30,-45]) cube([30,60,70],center=true);
        translate([-40,40,30]) rotate([0,0,-45]) cube([50,120,70],center=true);

        translate([0,3,10]) rotate([-90,0,0]) male_dovetail(40);
        translate([-3,0,10]) rotate([-90,0,90]) male_dovetail(40);

        translate([-15,15,0]) _bottom_hole();

        translate([5,-5,0]) _bottom_hole();

        translate([5,22,0]) _bottom_hole();

        translate([-22,-5,0]) _bottom_hole();
    }
    //%translate([2,-2,10]) rotate([-90,0,45]) hull() extention_90_bend(support=false);
}

module center_foot() {
    //offset = sqrt(15*12)/2;
    offset = 15;
    difference() {
        union() {
            translate([0,0,32/2]) rounded_cube_side(49.9,49.9,32,4,center=true);
            translate([20,20,32/2]) rotate([0,0,-45]) rounded_cube_side(44.9,49.9,32,4,center=true);
            hull() {
                translate([-70,-70,10]) rotate([90,0,45]) cylinder(d=30,h=20,center=true,$fn=40);
                translate([-10,-10,32/2]) cube([30,30,32],center=true);
            }
        }
        
        translate([0,0,12.39]) rotate([0,45,45]) translate([-15,15,0]) hull() corner_90(support=false);
        translate([20,20,30/2+10]) rotate([0,0,-45]) cube([30,30,30],center=true);
        

        translate([30,-30,23]) rotate([0,-20,-45]) cube([30,60,70],center=true);
        translate([-30,30,23]) rotate([0,20,-45]) cube([30,60,70],center=true);
        translate([0,0,-10]) cube([200,200,20],center=true);

        translate([48,48,0]) rotate([0,0,45]) cube([60,60,90],center=true);

        translate([2,2,10]) rotate([-90,0,-45]) male_dovetail(40);
        rotate([0,0,-45]) translate([-14.99,-9,25]) rotate([-90,90,0]) male_dovetail(50);
        rotate([0,0,-45]) translate([14.99,-9,25]) rotate([-90,-90,0]) male_dovetail(50);

        translate([-17,-17,0]) _bottom_hole();
        translate([17,-17,0]) _bottom_hole();
        translate([-17,17,0]) _bottom_hole();

        translate([11,11,0]) _bottom_hole();
        
        translate([-73,-73,15]) rotate([90,0,45]) cylinder(d=clip_bolt_dia_minus,h=50,center=true,$fn=30);
        
        translate([-73,-73,15]) rotate([90,0,45]) hull() {
            translate([0,30,-10]) cube([70,1,10],center=true);
            translate([0,0,-10]) cylinder(d=clip_bolt_dia_minus+14,h=10,center=true,$fn=30);
        }
        translate([-73,-73,15]) rotate([90,0,45]) hull() {
            translate([0,30,10]) cube([70,1,10],center=true);
            translate([0,0,10]) cylinder(d=clip_bolt_dia_minus+14   ,h=10,center=true,$fn=30);
        }
    }
}

//corner_foot();
center_foot();