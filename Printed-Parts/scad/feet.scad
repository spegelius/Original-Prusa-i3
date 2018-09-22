
use <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/extention.scad>;

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
        translate([0,0,32/2]) rounded_cube_side(49.9,49.9,32,4,center=true);
        translate([0,0,12.39]) rotate([0,45,45]) translate([-15,15,0]) hull() extention_90_bend(support=false);

        translate([30,-30,23]) rotate([0,-20,-45]) cube([30,60,70],center=true);
        translate([-30,30,23]) rotate([0,20,-45]) cube([30,60,70],center=true);
        translate([-30,-30,21]) rotate([0,-23,-135]) cube([30,60,70],center=true);

        translate([38,38,0]) rotate([0,0,45]) cube([60,60,90],center=true);

        translate([2,2,10]) rotate([-90,0,-45]) male_dovetail(40);
        rotate([0,0,-45]) translate([-14.99,-9,25]) rotate([-90,90,0]) male_dovetail(30);
        rotate([0,0,-45]) translate([14.99,-9,25]) rotate([-90,-90,0]) male_dovetail(30);

        translate([-17,-17,0]) _bottom_hole();
        translate([17,-17,0]) _bottom_hole();
        translate([-17,17,0]) _bottom_hole();

        translate([11,11,0]) _bottom_hole();
    }
}

//corner_foot();
center_foot();