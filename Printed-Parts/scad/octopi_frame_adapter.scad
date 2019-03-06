
use <../../Dollo/NEW_long_ties/include.scad>;

// for this case: https://www.thingiverse.com/thing:2599773/files

module octopi_frame_adapter() {
    difference() {
        union() {
            chamfered_cube(30+16,30,10,1.5,center=true);
            translate([3.5,30/2-2,0]) chamfered_cube(53,9,10,1.5,center=true);
        }
        translate([0,-5,0]) cube([30,30,12],center=true);
        translate([-15,-5,-20/2]) rotate([0,0,90]) male_dovetail(20);
        translate([15,-5,-20/2]) rotate([0,0,-90]) male_dovetail(20);
        
        translate([-43/2+3.5,18,0]) rotate([90,0,0]) cylinder(d=2.8,h=10,$fn=20);
        translate([43/2+3.5,18,0]) rotate([90,0,0]) cylinder(d=2.8,h=10,$fn=20);
   }
}

octopi_frame_adapter();