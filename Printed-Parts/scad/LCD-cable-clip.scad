// PRUSA iteration3
// LCD cable clip
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../../Dollo/NEW_long_ties/globals.scad>;
include <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/long_tie.scad>;

module lcd_cable_clip_rod_coutout() {
    // rod cutout    
    translate([0,0,-1]) cylinder(r=5,h = 10, $fn=30);
    translate([-4.5,0,-5]) cube([9,15,15]);
}

module lcd_cable_clip_cable_cut(height=3) {
    // LCD cable cut
    translate([8,-12,-1]) cube([2,19,height+2]);
    translate([9,7,-1]) cylinder(r=1,h = height+2, $fn=30);
}
    
module lcd_cable_clip_corners(height=3) {
    //corners
    translate([2,-13.75,-1]) rotate([0,0,45]) cube([5,5,height+2]);    
    translate([4,6,-1]) rotate([0,0,45]) cube([10,10,height+2]);    
    translate([14,6,-1]) rotate([0,0,45]) cube([10,10,height+2]);    
    translate([-3,3,-1]) rotate([0,0,45]) cube([5,5,height+7]);    
    translate([3,3,height]) rotate([0,0,45]) cube([5,5,height+7]);    
}

module lcd_cable_clip_cable_cut_ends(height=3) {
    // LCD cable cut ends
    translate([7.5,-8,0]) cylinder(r=1,h = height, $fn=30);
    translate([10.5,-8,0]) cylinder(r=1,h = height, $fn=30);
}

module lcd_cable_clip() {
    union() {
        difference() {
            union() {
                cylinder(r=7,h = 7, $fn=30);
                translate([2,-8,0]) cube([9.5,18,3]);
                translate([2,-9,0]) cube([5.5,5,3]);
            }
            lcd_cable_clip_rod_coutout();
            lcd_cable_clip_cable_cut();
            lcd_cable_clip_corners();
        }
        lcd_cable_clip_cable_cut_ends();
    }
}

module dollo_lcd_cable_clip() {
    h = 8;
    union() {
        difference() {
            union() {
                translate([6,-8,0]) cube([5.5,18,h]);
                translate([6,-9,0]) cube([1.5,5,h]);
                translate([6.001,0,h+4]) rotate([90,0,-90]) intersection() {
                    long_tie_split(h*2);
                    translate([-10/2,-12,0]) cube([10,h,10]);
                }
            }
            translate([3.5,-1,0]) cube([3,2,h+1]);

            lcd_cable_clip_cable_cut(h);
            lcd_cable_clip_corners(h);
        }
        lcd_cable_clip_cable_cut_ends(h);
    }
}

//lcd_cable_clip();
dollo_lcd_cable_clip();
