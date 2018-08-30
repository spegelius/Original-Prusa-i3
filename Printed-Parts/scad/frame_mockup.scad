
use <y-corners.scad>;
use <PSU-Y-part.scad>;
use <y-motor.scad>;
use <y-idler.scad>;
use <y-belt-holder.scad>;
use <Y-distance.scad>;
use <z-axis-bottom.scad>;
use <z-axis-top.scad>;
use <PSU-cover-NODRILL.scad>;

use <../../AluParts/alu-frame.scad>;

use <../../Dollo/NEW_long_ties/extention.scad>;
include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/psu_holder.scad>;

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

module smooth_rod_z() {
    color("grey") cylinder(d=8,h=320,$fn=30);
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

module z_rods() {
    translate([-181.8,10.4,50]) smooth_rod_z();
    translate([181.8,10.4,50]) smooth_rod_z();
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
    color("black") translate([corner_x_offset+13, corner_y_offset-13,6]) PSU_y_part();
    threaded_rods();
    // Y motor
    //color("DarkOrange") translate([corner_x_offset-65,corner_y_offset+11,0]) rotate([90,0,-90]) y_motor();
    // Y idler
    color("DarkOrange") translate([-19/2,-corner_y_offset+9,22]) rotate([0,0,180]) y_idler();
    y_rods();

    color("DarkOrange") translate([40,corner_y_offset+15,20]) rotate([90,0,-90]) y_distance();
    
    translate([130.5,49,24]) rotate([90,0,90]) PSU_cover();
    //%rotate([90,0,90]) mock_psu();
    
    translate([185,corner_y_offset-100-6.3,55]) rotate([180,0,-90]) z_bottom_right();
    translate([-198,corner_y_offset-100-6.3,55]) rotate([180,0,-90]) z_bottom_left();
    
    translate([185,corner_y_offset-100-6.3,370]) rotate([180,0,-90]) z_top_right();
    translate([-200,corner_y_offset-100-6.3,370]) rotate([180,0,-90]) z_top_left();
    z_rods();
    
    color("DarkSlateGray") translate([-185,corner_y_offset-100,0]) rotate([90,0,0]) frame();
    //translate([0,corner_y_offset,0]) cube([100,1,10]);
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

module extention_middle() {
    difference() {
        extention(support=false);
        translate([35,-15,60]) hull() {
            cube([35,35,40],center=true);
            cube([5,35,70],center=true);
        }
        translate([16,-28.6,78]) rotate([45,0,0]) cube([10,5,10]);
        translate([16,-5,81.5]) rotate([-45,0,0]) cube([10,5,10]);
    }
}

module view_new() {
    color("lightgrey") {
        translate([120-40,72,0]) rotate([-90,0,0]) extention(2, support=false);
        translate([120-40,-138,0]) rotate([-90,0,0]) extention(6, support=false);

        translate([-120+10,72,0]) rotate([-90,0,0]) extention(2, support=false);
        translate([-120+10,-138,0]) rotate([-90,0,0]) extention(6, support=false);
        
        translate([-120/2,corner_y_offset+36,0]) rotate([-90,0,-90]) extention(4, support=false);
        translate([-120/2,-corner_y_offset-12,0]) rotate([-90,0,-90]) extention(4, support=false);
        translate([-120/2,corner_y_offset-104,0]) rotate([-90,-90,-90]) extention_middle();
        
        translate([-120+23,120+49,30]) rotate([90,0,45]) extention_90_bend();
        translate([120-23,120+49,30]) rotate([90,0,-45]) extention_90_bend();

        translate([-120+23,-120-55,30]) rotate([90,0,135]) extention_90_bend();
        translate([120-23,-120-55,30]) rotate([90,0,-135]) extention_90_bend();
        
        translate([-167,corner_y_offset-74,13]) rotate([0,45,0]) extention_90_bend(true);
        translate([167,corner_y_offset-74,13]) rotate([0,-45,0]) extention_90_bend(true);
        
        //translate([400,0,0]) {
            translate([-180,corner_y_offset-74,50]) extention(4, support=false);
            translate([150,corner_y_offset-74,50]) extention(4, support=false);
            
            translate([-180,corner_y_offset-74,170]) extention(4, support=false);
            translate([150,corner_y_offset-74,170]) extention(4, support=false);
            
            translate([-180,corner_y_offset-74,290]) extention(4, support=false);
            translate([150,corner_y_offset-74,290]) extention(4, support=false);


        //}
        
        translate([-70-120/2,corner_y_offset-74,0]) rotate([0,0,-90]) extention_cross();
        translate([120/2,corner_y_offset-74,0]) rotate([0,0,-90]) extention_cross();
    }
    
    // extra z height
    z_offset = 20;
    
    color("white") {
        translate([-120+24,-188,0]) dollo_corner_left();
        translate([120-24,-188,0]) dollo_corner_right();
    
        translate([120-24,182,0]) dollo_corner_back_right();
        translate([-120+24,182,0]) dollo_corner_back_left();
        
        translate([185,corner_y_offset-100-6.3,z_offset+55]) rotate([180,0,-90]) dollo_z_bottom_right();
        translate([-198,corner_y_offset-100-6.3,z_offset+55]) rotate([180,0,-90]) dollo_z_bottom_left();
    
        translate([185,corner_y_offset-100-6.3,z_offset+370]) rotate([180,0,-90]) dollo_z_top_right();
        translate([-200,corner_y_offset-100-6.3,z_offset+370]) rotate([180,0,-90]) dollo_z_top_left();
    }
    
    y_rods();

    //PSU Y part
    color("black") translate([corner_x_offset+13, corner_y_offset-13,6]) dollo_PSU_y_part();
    
    translate([130.5,49+30-4+5,24]) rotate([90,0,90]) PSU_cover();
    
    // Y motor
    color("DarkOrange") translate([corner_x_offset-65,corner_y_offset+11,0]) rotate([90,0,-90]) dollo_y_motor();
    
    // Y idler
    color("DarkOrange") translate([-19/2,-corner_y_offset+9,22]) rotate([0,0,180]) dollo_y_idler();
    
    translate([0,0,z_offset]) z_rods();
    
    bed_carriage_assembly();
}

//translate([200,0,0]) view_original();
translate([-200,0,0]) view_new();
//extention_cross();
//extention_middle();
//bed_carriage_assembly();