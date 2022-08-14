
use <mockups.scad>;

module MK2_e() {
    translate([16.5,12,0])
    rotate([90,0,0])
    import("../stl/x-carriage.stl");

    translate([16.5-34,12,31])
    rotate([-90,0,0])
    import("../stl/extruder-body.stl");
}

// for debugging, needs to MK2.5 extruder body STL
// files somewhere
module MK2_5_e() {
    translate([-0.5,29,72.5])
    rotate([90,0,180])
    import("c:/temp/Original-prusa-i3/Printed-parts/stl/extruder-body.stl");
    
    translate([16.5,12,0])
    rotate([90,0,0])
    import("c:/temp/Original-prusa-i3/Printed-parts/stl/x-carriage.stl");
}

//MK2_e();
//MK2_5_e();

// reference bearings
rotate([0,90,0])
mock_LM8UU();

translate([-12.2,0,45])
rotate([0,90,0])
mock_LM8UU();

translate([12.2,0,45])
rotate([0,90,0])
mock_LM8UU();

// pinda MK2
translate([-23,18,-30])
color("red")
cylinder(d=8,h=30);

// pinda MK2.5
translate([-23.5,24,-30])
color("red")
cylinder(d=8,h=30);