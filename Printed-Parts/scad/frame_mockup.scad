
use <y-corners.scad>;
use <PSU-Y-part.scad>;
use <y-motor.scad>;
use <y-idler.scad>;
use <y-belt-holder.scad>;
use <Y-distance.scad>;

use <../../AluParts/alu-frame.scad>;

use <../../Dollo/NEW_long_ties/extention.scad>;
include <../../Dollo/NEW_long_ties/globals.scad>;

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


module view_original() {
    corners();
    //PSU Y part
    color("black") translate([corner_x_offset+13, corner_y_offset-13,6]) final_part();
    threaded_rods();
    // Y motor
    color("DarkOrange") translate([corner_x_offset-65,corner_y_offset+11,0]) rotate([90,0,-90]) y_motor();
    // Y idler
    color("DarkOrange") translate([-19/2,-corner_y_offset+9,22]) rotate([0,0,180]) y_idler();
    y_rods();

    color("DarkOrange") translate([40,corner_y_offset+15,20]) rotate([90,0,-90]) y_distance();
    
    color("DarkSlateGray") translate([-185,corner_y_offset-22-100,0]) rotate([90,0,0]) frame();
    bed_carriage_assembly();
    
}

module extention_cross() {
    difference() {
        extention_base(70);
        translate([-1,70/2,0]) rotate([90,0,90]) male_dovetail(32);
        translate([-1,70/2,30]) rotate([90,180,90]) male_dovetail(32);
        
        translate([30,70/2,15]) rotate([0,45,90]) tie_end();
        translate([0,70/2,15]) rotate([0,45,-90]) tie_end();
        
        translate([15,70/2,15]) rotate([0,90,0]) cylinder(h=50, d= metal_rod_size, center=true);
    }
}

module view_new() {
    color("lightgrey") {
        translate([120-40,48,0]) rotate([-90,0,0]) extention(3, support=false);
        translate([120-40,-132,0]) rotate([-90,0,0]) extention(5, support=false);

        translate([-120+10,48,0]) rotate([-90,0,0]) extention(3, support=false);
        translate([-120+10,-132,0]) rotate([-90,0,0]) extention(5, support=false);
        
        translate([-120/2,corner_y_offset+42,0]) rotate([-90,0,-90]) extention(4, support=false);
        translate([-120/2,-corner_y_offset-6,0]) rotate([-90,0,-90]) extention(4, support=false);
        translate([-120/2,corner_y_offset-22-76.3,0]) rotate([-90,0,-90]) extention(4, support=false);
        
        translate([-120+25,120+53,30]) rotate([90,0,45]) extention_90_bend();
        translate([120-25,120+53,30]) rotate([90,0,-45]) extention_90_bend();

        translate([-120+25,-120-47,30]) rotate([90,0,135]) extention_90_bend();
        translate([120-25,-120-47,30]) rotate([90,0,-135]) extention_90_bend();
        
        translate([-165,corner_y_offset-22-76.3,15]) rotate([0,45,0]) extention_90_bend();
        translate([165,corner_y_offset-22-76.3,15]) rotate([0,-45,0]) extention_90_bend();
        
        //translate([400,0,0]) {
            translate([-180,corner_y_offset-22-76.3,50]) extention(4, support=false);
            translate([150,corner_y_offset-22-76.3,30]) extention(4, support=false);
        //}
        
        translate([-70-120/2,corner_y_offset-22-76.3,0]) rotate([0,0,-90]) extention_cross();
        translate([120/2,corner_y_offset-22-76.3,0]) rotate([0,0,-90]) extention_cross();
    }
    
    y_rods();
    color("white") translate([-120+24,-182,0]) dollo_corner_left();
    color("white") translate([120-24,-182,0]) dollo_corner_right();
    
    color("white") translate([120-24,188,0]) dollo_corner_back_right();
    color("white") translate([-120+24,188,0]) dollo_corner_back_left();
}

//translate([200,0,0]) view_original();
translate([-200,0,0]) view_new();
//extention_cross();
//bed_carriage_assembly();