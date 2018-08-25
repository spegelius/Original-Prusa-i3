
use <y-corners.scad>;
use <PSU-Y-part.scad>;
use <y-motor.scad>;
use <y-idler.scad>;
use <y-belt-holder.scad>;

use <../../AluParts/alu-frame.scad>;

corner_y_offset = 146;
corner_x_offset = 152/2+18/2;

module threaded_rod() {
    color("black") translate([200/2,0,0]) rotate([0,-90,0]) cylinder(d=8,h=200,$fn=30);
}

module threaded_rod_large() {
    color("black") translate([0,350/2,0]) rotate([90,0,0]) cylinder(d=10,h=350,$fn=30);
}

module smooth_rod_y() {
    color("grey") translate([0,330/2,0]) rotate([90,0,0]) cylinder(d=8,h=330,$fn=30);
}

module mock_LM8UU() {
    color("silver") difference() {
        cylinder(d=15,h=24,$fn=30);
        translate([0,0,-0.5]) cylinder(d=8,h=25,$fn=30);
    }
}

// corners
module corners() {
    color("DarkOrange") {
        translate([-corner_x_offset,-corner_y_offset,0]) rotate([90,0,0]) corner();
        translate([corner_x_offset,-corner_y_offset,0]) rotate([90,0,0]) corner();
        translate([-corner_x_offset,corner_y_offset,0]) rotate([90,0,180]) corner();
        translate([corner_x_offset,corner_y_offset,0]) rotate([90,0,180]) corner();
    }
}


module threaded_rods() {
    // corner theaded rods
    translate([-corner_x_offset,0,20]) threaded_rod_large();
    translate([corner_x_offset,0,20]) threaded_rod_large();

    translate([0,corner_y_offset+11,10]) threaded_rod();
    translate([0,corner_y_offset+11,30]) threaded_rod();

    translate([0,-corner_y_offset-11,10]) threaded_rod();
    translate([0,-corner_y_offset-11,30]) threaded_rod();
}



module y_rods() {
    translate([-corner_x_offset,0,47]) smooth_rod_y();
    translate([corner_x_offset,0,47]) smooth_rod_y();
}

module bed_carriage_assembly() {
    translate([-220/2,50,58.9]) rotate([180,0,0]) {
        color("DarkSlateGray") bed_carriage();
        translate([25,75-24/2,6.3+7.5-1.9]) rotate([-90,0,0]) mock_LM8UU();
        translate([25,145-24/2,6.3+7.5-1.9]) rotate([-90,0,0]) mock_LM8UU();
        translate([25+170,110-24/2,6.3+7.5-1.9]) rotate([-90,0,0]) mock_LM8UU();
        color("DarkOrange") translate([205/2,205/2+23,26+6.3]) rotate([-90,0,-90]) y_belt_holder();
    }
}


module view() {
    corners();
    //PSU Y part
    color("black") translate([corner_x_offset+13, corner_y_offset-13,6]) final_part();
    threaded_rods();
    // Y motor
    translate([corner_x_offset-65,corner_y_offset+11,0]) rotate([90,0,-90]) y_motor();
    // Y idler
    translate([-19/2,-corner_y_offset+9,22]) rotate([0,0,180]) y_idler();
    y_rods();
    color("DarkSlateGray") translate([-185,corner_y_offset-22-100,0]) rotate([90,0,0]) frame();
    bed_carriage_assembly();
}

view();

//bed_carriage_assembly();