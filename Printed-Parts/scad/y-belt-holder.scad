// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <../../Dollo/NEW_long_ties/include.scad>;

//debug_y_belt_holder_printed_carriage();

//y_belt_holder();

//y_belt_holder_printed_carriage();
y_belt_holder_printed_carriage_2();


module debug_y_belt_holder_printed_carriage() {
    translate([0, 0, 26])
    rotate([-90, 0, 0])
    y_belt_holder_printed_carriage();

    translate([15, -2.5, 0])
    rotate([0, 0, 180])
    y_belt_holder_printed_carriage_2();
}


module main_body(pc=false) {
    translate([-1, -1, -1 ])
    cube([30, 27, 15]);

    translate([-10, 16, -1])
    cube([50.5, 10, 15]);

    if (pc) {
        hull() {
            translate([30, 26, 15])
            rotate([90, 0, 0])
            cylinder(d=12, h=8, $fn=30);

            translate([30, 26 - 8/2, 10])
            cube([16, 8, 1], center=true);
        }

        hull() {
            translate([1, 26, 15])
            rotate([90, 0, 0])
            cylinder(d=12, h=8, $fn=30);

            translate([1, 26 - 8/2, 10])
            cube([16, 8, 1], center=true);
        }
        
    }

    translate([-10, 23, -1])
    cube([52, 3, 15]);
}

module belt_holders()
{
    // upper belt holder
    translate([16, 18, 0])
    cylinder(h=11, r=3.5, $fn=30);

    // upper belt holder cone
    translate([16, 18, 11])
    cylinder(h=3, r1=3.5, r2=2.5, $fn=30);

    // lower belt holder
    translate([12, 5, 0])
    cylinder(h=11, r=3.5, $fn=30);

    // lower belt holder cone
    translate([12, 5, 11])
    cylinder(h=3, r1=3.5, r2=2.5, $fn=30);
}

module screws(pc=false)
{
    if(pc) {
        //screw head hole
        translate([-4, 28, 7.5])
        rotate([90, 0, 0])
        cylinder(h=4, r=4, $fn=30);

        //screw head hole
        translate([37, 28, 7.5])
        rotate([90, 0, 0])
        cylinder(h=4, r=4, $fn=30);

        // mount screw hole
        translate([1, 26, 17])
        rotate([90, 0, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);

        // mount screw hole
        translate([30, 26, 17])
        rotate([90, 0, 0])
        cylinder(d=3.2, h=30, center=true, $fn=30);

        // mount screw head hole
        translate([1, 18, 17])
        rotate([90, 0, 0])
        cylinder(d=8, h=30, $fn=30);

        // mount screw head hole
        translate([30, 18, 17])
        rotate([90, 0, 0])
        cylinder(d=8, h=30, $fn=30);

        translate([7, 23, 0])
        cylinder(d=2.8, h=25, center=true, $fn=20);

        translate([25, 23, 0])
        cylinder(d=2.8, h=25, center=true, $fn=20);


    } else {
        //screw hole
        translate([-2.5, 28, 7.5])
        rotate([90, 0, 0])
        cylinder(h=10, r=1.6, $fn=30);

        //screw hole
        translate([-5.5, 28, 7.5])
        rotate([90, 0, 0])
        cylinder(h=10, r=1.6, $fn=30);

        //screw hole - head
        translate([-2.5, 22, 7.5])
        rotate([90, 0, 0])
        cylinder(h=7, r=3, $fn=30);

        //screw hole - head
        translate([-5.5, 22, 7.5])
        rotate([90, 0, 0])
        cylinder(h=10, r=3, $fn=30);

        //screw hole
        translate([35.5, 28, 7.5])
        rotate([90, 0, 0])
        cylinder(h=10, r=1.6, $fn=30);

        //screw hole
        translate([38.5, 28, 7.5])
        rotate([90, 0, 0])
        cylinder(h=10, r=1.6, $fn=30);

        //screw hole - head
        translate([35.5, 22, 7.5])
        rotate([90, 0, 0])
        cylinder(h=10, r=3, $fn=30);

        //screw hole - head
        translate([38.5, 22, 7.5])
        rotate([90, 0, 0])
        cylinder(h=10, r=3, $fn=30);
        
        translate([-5.5, 21, 5.9])
        cube([3, 6, 3.2]);

        translate([35.5, 21, 5.9])
        cube([3, 6, 3.2]);

        translate([-5.5, 15, 4.5])
        cube([3, 7, 6]);

        translate([35.5, 15, 4.5])
        cube([6, 7, 6]);
    }
}

//belt_holders();
module main(pc=false) {
    difference() {
        main_body(pc=pc);

        // upper belt space cutaway
        translate([16, 18, 2])
        cylinder(h=16, r=7.2, $fn=30);

        // lower belt space cutaway
        translate([12, 5, 2])
        cylinder(h=16, r=7.2, $fn=30);

        translate([-20, 9, 2])
        cube([28, 2.1, 16]); 

        rotate([0, 0, 40])
        translate([11, 1, 2])
        cube([10, 4, 16]);     
    
        translate([10, 7, 2 ])
        cube([32, 2.1, 16]); 

        translate([16, 8, 11])
        rotate([45, 0, 0])
        cube([15, 5, 5]);     

        translate([-2, 10, 11])
        rotate([45, 0, 0])
        cube([10, 5, 5]);     

        screws(pc=pc);

        // corner cutoff
        translate([30, -13, -2])
        rotate([0, 0, 45])
        cube([10, 10, 20]);    

        translate([-2, -13, -2])
        rotate([0, 0, 45])
        cube([10, 10, 20]);    
    }
}

module selective_infill()
{
    // print part reinforcement
    translate([1, 0.5, -0.5])
    cube([0.1, 5, 13]);

    translate([3, 0.5, -0.5])
    cube([0.1, 5, 13]);

    translate([21.5, 0.5, -0.5])
    cube([0.1, 4, 12]);

    translate([23.5, 0.5, -0.5])
    cube([0.1, 4, 12]);

    translate([25.5, 0.5, -0.5])
    cube([0.1, 4, 12]);

    translate([11.5, 3, -0.5])
    cube([1, 0.2, 12]);

    translate([10, 5, -0.5])
    cube([4, 0.2, 12]);

    translate([11.5, 6.5, -0.5])
    cube([1, 0.2, 12]);

    translate([15.5, 16, -0.5])
    cube([1, 0.2, 12]);

    translate([14, 18, -0.5])
    cube([4, 0.2, 12]);

    translate([15.5, 20, -0.5])
    cube([1, 0.2, 12]);   

    translate([1, 5.5, -0.5])
    cube([0.1, 14, 2]);    

    translate([3, 5.5, -0.5])
    cube([0.1, 14, 2]);   

    translate([5, 0.5, -0.5])
    cube([0.1, 19, 2]);   

    translate([7, 0.5, -0.5])
    cube([0.1, 19, 2]);   

    translate([19.5, 0.5, -0.5])
    cube([0.1, 18, 2]);

    translate([21.5, 4.5, -0.5])
    cube([0.1, 14, 2]);

    translate([23.5, 4.5, -0.5])
    cube([0.1, 14, 2]);

    translate([25.5, 4.5, -0.5])
    cube([0.1, 14, 2]);
}
    
    
module y_belt_holder() {
    difference() {
        union() {
            main();
            belt_holders();  
        }
        selective_infill();
    }
}

module y_belt_holder_printed_carriage() {
    difference() {
        union() {
            main(pc=true);
            belt_holders();  
        }
        selective_infill();
    }
}

module y_belt_holder_printed_carriage_2() {
    difference() {
        intersection() {
            translate([0, 0, 8/2])
            rounded_cube_side(
                42, 12, 8, 8, center=true, $fn=30
            );

            translate([0, 4.5, 0])
            cube([50, 12, 30], center=true);
        }

        translate([-32/2, 2, 0])
        cylinder(d=3.2, h=30, center=true, $fn=20);

        translate([32/2, 2, 0])
        cylinder(d=3.2, h=30, center=true, $fn=20);

        translate([-10, 0, 3])
        rotate([90, 0, 0])
        cylinder(d=3.2, h=30, center=true, $fn=20);

        translate([8, 0, 3])
        rotate([90, 0, 0])
        cylinder(d=3.2, h=30, center=true, $fn=20);

        translate([-10, 3.5, 3])
        rotate([-90, 0, 0])
        cylinder(d=7, h=10, $fn=20);

        translate([8, 3.5, 3])
        rotate([-90, 0, 0])
        cylinder(d=7, h=10, $fn=20);

    }
}