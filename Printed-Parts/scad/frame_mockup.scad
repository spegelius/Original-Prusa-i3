
use <y-corners.scad>;
use <PSU-Y-part.scad>;
use <y-motor.scad>;
use <y-idler.scad>;
use <y-belt-holder.scad>;
use <Y-distance.scad>;
use <z-axis-bottom.scad>;
use <z-axis-top.scad>;
use <PSU-cover-NODRILL.scad>;
use <feet.scad>;
use <x-end-motor.scad>;
use <x-end-idler.scad>;
use <LCD-cover-ORIGINAL.scad>;
use <lcd-support-A.scad>;
use <lcd-support-B.scad>;
use <LCD-cable-clip.scad>;
use <mockups.scad>;
use <RAMBo-cover-base.scad>;
use <RAMBo-cover-hinges.scad>;
use <RAMBo-cover-doors.scad>;

use <../../AluParts/alu-frame.scad>;

use <../../Dollo/NEW_long_ties/extention.scad>;
use <../../Dollo/NEW_long_ties/corner.scad>;
include <../../Dollo/NEW_long_ties/globals.scad>;
use <../../Dollo/NEW_long_ties/psu_holder.scad>;
use <../../Dollo/NEW_long_ties/stabilizer.scad>;


////// VARIABLES //////
corner_y_offset = 146;
corner_x_offset = 152/2+18/2;


////// VIEW //////
translate([220,0,0])
view_original();

translate([-220,0,0])
view_new();

//rotate([90,0,0])
//extention_cross();

//extention_middle(support=true);
//bed_carriage_assembly();
//extention_130();
//top_corner();


////// MODULES //////
module threaded_rod() {
    color("black")
    translate([200/2,0,0])
    rotate([0,-90,0])
    cylinder(d=8,h=200,$fn=30);
}

module threaded_rod_large() {
    color("black")
    translate([0,350/2,0])
    rotate([90,0,0])
    cylinder(d=10,h=350,$fn=30);
}

module smooth_rod_y() {
    color("DarkGrey")
    translate([0,330/2,0])
    rotate([90,0,0])
    cylinder(d=8,h=330,$fn=30);
}

module smooth_rod_z() {
    color("DarkGrey")
    cylinder(d=8,h=320,$fn=30);
}

module mock_LM8UU() {
    color("silver")
    render()
    difference() {
        cylinder(d=15,h=24,$fn=30);

        translate([0,0,-0.5])
        cylinder(d=8,h=25,$fn=30);
    }
}

// corners
module corners() {
    color("DarkOrange") {
        translate([-corner_x_offset,-corner_y_offset,0])
        rotate([90,0,0])
        render()
        corner();

        translate([corner_x_offset,-corner_y_offset,0])
        rotate([90,0,0])
        render()
        corner();

        translate([-corner_x_offset,corner_y_offset,0])
        rotate([90,0,180])
        render()
        corner();

        translate([corner_x_offset,corner_y_offset,0])
        rotate([90,0,180])
        render()
        corner();
    }
}
module threaded_rods() {
    // corner theaded rods
    translate([-corner_x_offset,0,20])
    threaded_rod_large();

    translate([corner_x_offset,0,20])
    threaded_rod_large();

    translate([0,corner_y_offset+11,10])
    threaded_rod();

    translate([0,corner_y_offset+11,30])
    threaded_rod();

    translate([0,-corner_y_offset-11,10])
    threaded_rod();

    translate([0,-corner_y_offset-11,30])
    threaded_rod();
}

module y_rods() {
    translate([-corner_x_offset,0,47])
    smooth_rod_y();

    translate([corner_x_offset,0,47])
    smooth_rod_y();
}

module z_rods() {
    translate([-182,10.4,50])
    smooth_rod_z();

    translate([182,10.4,50])
    smooth_rod_z();
}

module bed_carriage_assembly() {
    translate([-220/2,70,58.9])
    rotate([180,0,0]) {
        color("DarkSlateGray")
        render()
        bed_carriage();

        translate([25,75-24/2,6.3+7.5-1.9])
        rotate([-90,0,0])
        mock_LM8UU();

        translate([25,145-24/2,6.3+7.5-1.9])
        rotate([-90,0,0])
        mock_LM8UU();

        translate([25+170,110-24/2,6.3+7.5-1.9])
        rotate([-90,0,0])
        mock_LM8UU();

        color("DarkOrange")
        render()
        translate([205/2,205/2+23,26+6.3])
        rotate([-90,0,-90])
        y_belt_holder();
    }
}

module x_ends() {
    // x ends
    translate([-182,corner_y_offset-130-5.5,58+55+37]) 
    rotate([0,180,90])
    x_end_motor();

    translate([182,corner_y_offset-130-5.5,58+55+37])
    rotate([0,180,90])
    x_end_idler();
}

module LCD_assembly(dollo=false) {
    translate([-0.5,-210,49.5])
    rotate([-135,0,0]) {
        LCD_cover(dollo=dollo);

        if (dollo) {
            translate([55.5,48,21.5])
            rotate([225,0,0])
            rotate([0,90,0])
            dollo_lcd_support_A();

            translate([-54.5,48,21.5])
            rotate([45,0,0])
            rotate([0,90,180])
            dollo_lcd_support_B();
        } else {
            translate([65.5,48,21.5])
            rotate([45,0,0])
            rotate([0,90,180])
            lcd_support_A();

            translate([-54.5,48,21.5])
            rotate([45,0,0])
            rotate([0,90,180])
            lcd_support_B();
        }
    }
}
//LCD_assembly(dollo=true);

module cover(dollo=false) {
    if (dollo) {
        translate([-201,77,178.5])
        rotate([0,90,0])
        ramps_cover_base();

        translate([-136,169,178.5])
        rotate([180,90,0])
        RAMBo_doors(fan=true);

        translate([-165,75,47])
        rotate([0,0,180])
        dollo_lower_hinge();

        translate([-165,62,162])
        rotate([0,180,0])
        dollo_upper_hinge();
    } else {
        translate([-185,46,178.5])
        rotate([0,90,0])
        rambo_cover_base();

        translate([-134.5,51,178])
        rotate([180,0,90])
        upper_hinge();

        translate([-128.5,51,63])
        rotate([0,0,90])
        lower_hinge();

        translate([-130,138,178.5])
        rotate([180,90,0])
        RAMBo_doors();
    }
}
//cover(dollo=true);

module PSU(dollo=false) {
    if (dollo) {
        color("white")
        translate([130.5,74,23.5])
        rotate([90,0,90])
        render()
        dollo_PSU_cover_240W();

        %translate([132.5,72.5,61.5])
        rotate([90,0,90])
        render()
        mock_PSU_240W();

        color("white")
        translate([159,72.5,22])
        render()
        dollo_PSU_spacer();

        color("white")
        translate([142,49,153.5])
        render()
        dollo_PSU_top_harness_240W();
    } else {
        color("DarkOrange")
        translate([130.5,48,24])
        rotate([90,0,90])
        render()
        PSU_cover_240W();

        %translate([132.5,46.5,62])
        rotate([90,0,90])
        render()
        mock_PSU_240W();
    }
}

module bed() {
    translate([-254/2-1,-220+50,65])
    cube([254,220,3]);
}

module view_original() {
    corners();

    //PSU Y part
    color("black")
    translate([corner_x_offset+13, corner_y_offset-13,6])
    render()
    PSU_y_part();

    threaded_rods();

    // Y motor
    color("DarkOrange")
    translate([corner_x_offset-65,corner_y_offset+11,0])
    rotate([90,0,-90])
    render()
    y_motor();

    // Y idler
    color("DarkOrange")
    translate([-19/2,-corner_y_offset+9,22])
    rotate([0,0,180])
    render()
    y_idler();

    y_rods();

    color("DarkOrange")
    translate([40,corner_y_offset+15,20])
    rotate([90,0,-90])
    render()
    y_distance();

    PSU();

    color("DarkOrange")
    translate([185,corner_y_offset-100-6.3,55])
    rotate([180,0,-90])
    render()
    z_bottom_right();

    color("DarkOrange")
    translate([-198,corner_y_offset-100-6.3,55])
    rotate([180,0,-90])
    render()
    z_bottom_left();

    color("DarkOrange") {
        translate([185,corner_y_offset-100-6.3,370])
        rotate([180,0,-90])
        render()
        z_top_right();

        translate([-200,corner_y_offset-100-6.3,370])
        rotate([180,0,-90])
        render()
        z_top_left();
    }

    z_rods();

    color("DarkSlateGray")
    translate([-185,corner_y_offset-100,0])
    rotate([90,0,0])
    render()
    frame();

//    translate([0,corner_y_offset,0])
//    cube([100,1,10]);

    bed_carriage_assembly();

    color("DarkOrange")
    render()
    x_ends();

    color("DarkOrange")
    render()
    LCD_assembly();

    color("DarkOrange")
    render()
    cover();
    
    //bed();
}

module extention_cross() {
    difference() {
        extention_base(70, support=false);

        translate([-30/2-1,0,-30/2])
        rotate([90,0,90])
        male_dovetail(32);

        translate([-30/2-1,0,30/2])
        rotate([90,180,90])
        male_dovetail(32);

        translate([30/2,0,0])
        rotate([0,45,90])
        tie_end();

        translate([-30/2,0,0])
        rotate([0,45,-90])
        tie_end();
        
        rotate([0,90,0])
        cylinder(h=50, d=metal_rod_size, center=true);
    }
}

module extention_middle(support=false) {
    difference() {
        extention(support=support);

        translate([30/2+5,0,0])
        hull() {
            cube([40,35,40],center=true);
            cube([5,35,70],center=true);
        }
        translate([5,-30/2-.3,25])
        rotate([45,0,0])
        cube([10,5,10],center=true);

        translate([5,30/2+0.3,25])
        rotate([-45,0,0])
        cube([10,5,10],center=true);
    }
}

module extention_130() {
    extention(130/30, support=true);
}

module top_corner() {
    corner_90(corner_len=75,extra_stiff=true, support=true);
}

module view_new() {
    color("DarkGrey") {
        translate([120-25,102,30/2])
        rotate([-90,0,0])
        render()
        extention(2, support=false);

        translate([120-25,-48,30/2])
        rotate([-90,0,0])
        render()
        extention(6, support=false);

        translate([-120+25,102,30/2])
        rotate([-90,0,0])
        render()
        extention(2, support=false);

        translate([-120+25,-48,30/2])
        rotate([-90,0,0])
        render()
        extention(6, support=false);

        translate([0,corner_y_offset+21,30/2])
        rotate([-90,0,-90])
        render()
        extention(4, support=false);

        translate([0,-corner_y_offset-27,30/2])
        rotate([-90,0,-90])
        render()
        extention(4, support=false);

        translate([0,corner_y_offset-89,30/2])
        rotate([-90,-90,-90])
        render()
        extention_middle();
        
        translate([-120+23,120+49,30/2])
        rotate([90,0,45])
        render()
        corner_90(corner_len=20,support=false);

        translate([120-23,120+49,30/2])
        rotate([90,0,-45])
        render()
        corner_90(corner_len=20,support=false);

        translate([-120+23,-120-55,30/2])
        rotate([90,0,135])
        render()
        corner_90(corner_len=20,support=false);

        translate([120-23,-120-55,30/2])
        rotate([90,0,-135])
        render()
        corner_90(corner_len=20,support=false);

        translate([-167,corner_y_offset-89,13])
        rotate([0,45,0])
        render()
        corner_90(corner_len=20,extra_stiff=true, support=false);

        translate([167,corner_y_offset-89,13])
        rotate([0,-45,0])
        render()
        corner_90(corner_len=20,extra_stiff=true, support=false);

        translate([-167,corner_y_offset-89,442])
        rotate([0,135,0])
        render()
        corner_90(corner_len=75,extra_stiff=true, support=false);

        translate([167,corner_y_offset-89,442])
        rotate([0,-135,0])
        render()
        corner_90(corner_len=75,extra_stiff=true, support=false);

        //translate([400,0,0]) {
            translate([-165,corner_y_offset-89,110])
            render()
            extention(4, support=false);

            translate([165,corner_y_offset-89,110])
            render()
            extention(4, support=false);

            translate([-165,corner_y_offset-89,230])
            render()
            extention(4, support=false);

            translate([165,corner_y_offset-89,230])
            render()
            extention(4, support=false);

            translate([-165,corner_y_offset-89,320])
            render()
            extention(2, support=false);

            translate([165,corner_y_offset-89,320])
            render()
            extention(2, support=false);

            translate([0,corner_y_offset-89,440])
            rotate([0,90,0])
            render()
            extention(5, support=false);
        //}
        
        translate([-70/2-120/2,corner_y_offset-89,30/2])
        rotate([0,0,-90])
        render()
        extention_cross();

        translate([70/2+120/2,corner_y_offset-89,30/2])
        rotate([0,0,-90])
        render()
        extention_cross();
    }

    // extra z height
    z_offset = 20;

    color("white") {
        translate([-120+24,-188,0])
        render()
        dollo_y_corner_left();

        translate([120-24,-188,0])
        render()
        dollo_y_corner_right();

        translate([120-24,182,0])
        render()
        dollo_y_corner_back_right();

        translate([-120+24,182,0])
        render()
        dollo_y_corner_back_left();

        // for motors that don't need z coupler
        //translate([185,corner_y_offset-100-6.3,z_offset+55])
        //rotate([180,0,-90])
        //dollo_z_bottom_right();

        //translate([-198,corner_y_offset-100-6.3,z_offset+55])
        //rotate([180,0,-90])
        //dollo_z_bottom_left();

        // for motors that need z coupler
        color("DarkGrey")
        translate([185,corner_y_offset-100-6.3,z_offset+42])
        rotate([180,0,-90])
        render()
        dollo_z_bottom_right(true);

        translate([-198,corner_y_offset-100-6.3,z_offset+42])
        rotate([180,0,-90])
        render()
        dollo_z_bottom_left(true);

        translate([185,corner_y_offset-100-6.3,z_offset+385])
        rotate([180,0,-90])
        render()
        dollo_z_top_right();

        translate([-200,corner_y_offset-100-6.3,z_offset+385])
        rotate([180,0,-90])
        render()
        dollo_z_top_left();
    }
    
    y_rods();

    //PSU Y part
    color("black")
    translate([corner_x_offset+13, corner_y_offset-8,6])
    render()
    dollo_PSU_y_part();

    PSU(dollo=true);

    // Y motor
    color("white")
    translate([corner_x_offset-65,corner_y_offset+11,0])
    rotate([90,0,-90])
    render()
    dollo_y_motor();

    // Y idler
    color("white")
    translate([28/2,-corner_y_offset+9,22])
    rotate([0,90,180])
    render()
    dollo_y_idler_body();

    color("white") {
        translate([120-25,-173,-10])
        render()
        corner_foot();

        translate([-120+25,-173,-10])
        rotate([0,0,-90])
        render()
        corner_foot();

        translate([-120+25,167,-10])
        rotate([0,0,180])
        render()
        corner_foot();

        translate([120-25,167,-10])
        rotate([0,0,90])
        render()
        corner_foot();

        translate([156.5,57,-10])
        rotate([0,0,135])
        render()
        center_foot();

        translate([-156.5,57,-10])
        rotate([0,0,-45])
        render()
        center_foot();
    }

    translate([0,0,z_offset+15])
    z_rods();

    color("white")
    translate([0,0,213])
    render()
    x_ends();

    bed_carriage_assembly();
    //bed();

    color("white")
    render()
    translate([0,-5,0])
    LCD_assembly(dollo=true);

    color("white")
    render()
    cover(dollo=true);

    color("white")
    translate([-120+25,0,6])
    rotate([0,90,-90])
    dollo_lcd_cable_clip();
}
