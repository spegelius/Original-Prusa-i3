use <../../Dollo/NEW_long_ties/include.scad>;

use <lcd-support-A.scad>;
use <lcd-support-B.scad>;
use <y-corners.scad>;
use <feet.scad>;
use <LCD-cable-clip.scad>;


stl_base_path = "../../../_downloaded/";

improved_y_path = str(
    stl_base_path, "Prusa/MK2s improved Y axis/"
);


//_orig_y_back();
//_orig_y_front();
//debug_y_back_supports();
//debug_feet();
debug_lcd_cable_clip();
//_supports_form_y_front();
//_supports_form_y_back();


//new_improved_y_front();
//new_improved_y_front_soluble_supports();
//new_improved_y_front_supports();

//new_improved_y_back();
//new_improved_y_back_soluble_supports();
//new_improved_y_back_supports();


module debug_y_back_supports() {
    //new_improved_y_back();

    color("lightgrey")
    new_improved_y_back_soluble_supports();

    new_improved_y_back_supports();
}

module debug_feet() {

    new_improved_y_front();

    translate([-152/2 - 18/2 - 3, 180, - 10]) {
        improved_y_foot();

        translate([-13.5, -13.5, -3])
        foot_pad();
    }
}

module debug_lcd_cable_clip() {

    color("white")
    new_improved_y_front();

    translate([76, 26, 7])
    rotate([90, 0, 180])
    improved_y_lcd_cable_clip();
}

module _orig_y_front() {

//    translate([1, 95.85, 0])
//    import(
//        str(improved_y_path, "y-axis_front_tinkercad_meshlab.stl"),
//        convexity=10
//    );

    translate([1, 0, 0])
    import(
        str(improved_y_path, "y-axis_front_export.stl"),
        convexity=10
    );

//    translate([1, 0, 0])
//    import(
//        str(improved_y_path, "Unnamed-y-axis_inprovement_with_lcd_bracket.stl"),
//        convexity=10
//    );
    
}

module _orig_y_back() {

    translate([1, 0, 22])
    rotate([0, 0, 180])
    import(
        str(improved_y_path, "prusa_y-axis_back.stl"),
        convexity=10
    );
}

module _improved_frame(length) {
    module _end_plate() {
        module _side() {
            hull() {
                translate([90.8, 0, 45])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);

                translate([78.7, 0, 45])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);

                translate([70.3, 0, 36])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);

                translate([65.7, 0, 8/2])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);

                translate([54, 0, 15.2])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);

                translate([98.5, 0, 32])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);

                translate([98.5, 0, 8.8])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);

                translate([93.5, 0, 8/2])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=70);
            }
        }

        module _center() {
            hull() {
                translate([54, 0, 15.4])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=80);

                translate([-54, 0, 15.4])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=80);

                translate([74, 0, 41])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=80);

                translate([-74, 0, 41])
                rotate([90, 0, 0])
                cylinder(d=8, h=6, $fn=80);
            }
        }
        
        union() {
            _side();

            mirror([1, 0, 0])
            _side();

            _center();
        }
    }

    module _middle_plate() {
        difference() {
            translate([0, 10/2, 40/2])
            cube([188, 10, 40], center=true);
        }
    }

    module _frame() {
        translate([152/2 + 18/2, length/2 - 1, 34/2])
        rotate([90, 0, 0])
        chamfered_cube_side(
            30, 34, length - 2, 5, center=true
        );

        translate([67, length/2 - 1, 20/2 + 20])
        rotate([90, 0, 0])
        chamfered_cube_side(
            30, 20, length - 2, 4, center=true
        );

        translate([-152/2 - 18/2, length/2 - 1, 34/2])
        rotate([90, 0, 0])
        chamfered_cube_side(
            30, 34, length - 2, 5, center=true
        );

        translate([-67, length/2 - 1, 20/2 + 20])
        rotate([90, 0, 0])
        chamfered_cube_side(
            30, 20, length - 2, 4, center=true
        );

        translate([152/2 + 18/2, length - 7.5, 39])
        rotate([90, 0, 0])
        rounded_cube_side(
            18, 20, 10, 5, center=true, $fn=30
        );

        translate([-152/2 - 18/2, length - 7.5, 39])
        rotate([90, 0, 0])
        rounded_cube_side(
            18, 20, 10, 5, center=true, $fn=30
        );
    }

    difference() {
        union() {
            translate([0, length, 0])
            _end_plate();

            _middle_plate();

            _frame();
        }

        translate([-91, 0, 44])
        rotate([90, 0, 0])
        chamfered_cube_side(
            38, 20, length * 2 - 25, 8, center=true
        );

        translate([91, 0, 44])
        rotate([90, 0, 0])
        chamfered_cube_side(
            38, 20, length * 2 - 25, 8, center=true
        );

        translate([0, 0, -50/2 + 8])
        chamfered_cube(142, 50, 50, 15, center=true);

        translate([0, 0, 80/2 + 21])
        chamfered_cube(62, 80, 80, 20, center=true);

        translate([152/2 + 18/2 + 11, length - 0.5, 0])
        rotate([0, 0, 180])
        rod_holes();

        translate([-152/2 - 18/2 + 11, length - 0.5, 0])
        rotate([0, 0, 180])
        rod_holes();

        // rod holes
        translate([152/2 + 18/2, 0, 20])
        rotate([90, 0, 0])
        cylinder(d=10.4, h=500, center=true, $fn=30);

        translate([-152/2 - 18/2, 0, 20])
        rotate([90, 0, 0])
        cylinder(d=10.4, h=500, center=true, $fn=30);

        // nut holes
        translate([152/2 + 18/2, 0, 20])
        rotate([90, 0, 0])
        cylinder(d=22, h=18, center=true, $fn=30);

        translate([-152/2 - 18/2, 0, 20])
        rotate([90, 0, 0])
        cylinder(d=22, h=18, center=true, $fn=30);

        translate([152/2 + 18/2, length, 20])
        rotate([90, 0, 0])
        cylinder(d=22, h=4, center=true, $fn=30);

        translate([-152/2 - 18/2, length, 20])
        rotate([90, 0, 0])
        cylinder(d=22, h=4, center=true, $fn=30);


        // dove grooves
        translate([152/2 + 18/2, -1, -0.001])
        rotate([90, 0, 180])
        male_dovetail(length + 2, bridge_extra=0.25);

        translate([-152/2 - 18/2, -1, -0.001])
        rotate([90, 0, 180])
        male_dovetail(length + 2, bridge_extra=0.25);
    }
}

module new_improved_y_front() {

    module _y_front_body() {
        _improved_frame(207.7);

        translate([0, 196, 37])
        chamfered_cube(122, 21, 6, 1, center=true);

        translate([0, 196, 22.75])
        chamfered_cube(122, 21, 5.5, 1, center=true);

        translate([-17.6, 205/2, 11.4 + 11.6/2])
        chamfered_cube(12, 205, 11.6, 1.5, center=true);

        translate([20.6, 205/2, 11.4 + 11.6/2])
        chamfered_cube(12, 205, 11.6, 1.5, center=true);

        translate([1.5, 195, 11.4 + 11.6/2])
        chamfered_cube(
            39 + 11, 20, 11.6, 1.5, center=true
        );

        hull() {
            translate([10.5, 176.7, 30])
            rotate([0, 90, 0])
            chamfered_cylinder(20, 7, 1, center=true);

            translate([10.5, 192, 11.4 + 5/2])
            chamfered_cube(7, 24, 5, 1, center=true);

            translate([10.5, 192, 35 + 5/2])
            chamfered_cube(7, 24, 5, 1, center=true);
        }

        hull() {
            translate([-7.5, 176.7, 30])
            rotate([0, 90, 0])
            chamfered_cylinder(20, 7, 1, center=true);

            translate([-7.5, 192, 11.4 + 5/2])
            chamfered_cube(7, 24, 5, 1, center=true);

            translate([-7.5, 192, 35 + 5/2])
            chamfered_cube(7, 24, 5, 1, center=true);
        }
    }

    difference() {
        _y_front_body();
        
        // lcd mount holes
        #translate([60, 212, 13])
        rotate([90, 0, 0])
        cylinder(d=3.7, h=20, $fn=30);

        translate([60, 204.7, 13])
        rotate([90, 0, 0])
        cylinder(d=6, h=5, $fn=30);

        translate([-60, 212, 13])
        rotate([90, 0, 0])
        cylinder(d=3.7, h=20, $fn=30);

        translate([-60, 204.7, 13])
        rotate([90, 0, 0])
        cylinder(d=6, h=5, $fn=30);

        translate([0, 176.7, 30])
        rotate([0, 90, 0])
        cylinder(d=3.3, h=40, center=true, $fn=20);

        translate([14.5, 176.7, 30])
        rotate([0, 90, 0])
        cylinder(d=6.5, h=10, center=true, $fn=20);

        translate([-12.5, 176.7, 30])
        rotate([0, 90, 0])
        cylinder(d=6.5, h=10, center=true, $fn=20);

        // dove grooves
        translate([152/2 + 18/2 - 15, 30, -0.001])
        rotate([0, 0, -90])
        male_dovetail(15);

        translate([152/2 + 18/2 - 15, 60, -0.001])
        rotate([0, 0, -90])
        male_dovetail(15);

        translate([152/2 + 18/2 - 15, 90, -0.001])
        rotate([0, 0, -90])
        male_dovetail(15);

        translate([152/2 + 18/2 - 15, 120, -0.001])
        rotate([0, 0, -90])
        male_dovetail(15);

        translate([152/2 + 18/2 - 15, 150, -0.001])
        rotate([0, 0, -90])
        male_dovetail(15);

        translate([152/2 + 18/2 - 15, 180, -0.001])
        rotate([0, 0, -90])
        male_dovetail(15);
    }

//    %translate([1, 199.7, 22])
//    rotate([0, 0, 180])
//    _orig_y_front();
}

module new_improved_y_back() {

    module _y_back_body() {
        union() {
            _improved_frame(122.7);

            translate([6, 120/2, 12/2 + 8])
            cube([8, 120, 12], center=true);

            translate([-0.5 , 120 - 50/2, 12/2 + 8])
            chamfered_cube(23, 50, 12, 1, center=true);

            translate([-0.5 , 120 - 20/2, 20/2 + 15])
            cube([23, 20, 20], center=true);

            translate([-1, 105, 30/2 + 8])
            cube([22, 25, 30], center=true);

            translate([-1, 100, 20/2 + 8])
            cube([22, 25, 20], center=true);

            hull() {
                translate([6, 67, 14])
                rotate([0, 90, 0])
                chamfered_cylinder(12, 5, 1, $fn=60);

                translate([6, 98, 14])
                rotate([0, 90, 0])
                chamfered_cylinder(12, 5, 1, $fn=60);
            }

            hull() {
                translate([6, 90, 13.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 5, 1, $fn=60);

                translate([6, 98, 13.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 5, 1, $fn=60);

                translate([6, 90, 13.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 5, 1, $fn=60);

                translate([6, 98, 24.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 5, 1, $fn=60);
            }

            hull() {
                translate([6, 98, 13.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 5, 1, $fn=60);

                translate([6, 98, 44.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 5, 1, $fn=60);
            }

            hull() {
                translate([1, 98, 44.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 10, 1, $fn=60);

                translate([1, 103, 39.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 10, 1, $fn=60);
            }

            hull() {
                translate([1, 117, 39.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 10, 1, $fn=60);

                translate([1, 101, 39.5])
                rotate([0, 90, 0])
                chamfered_cylinder(11, 10, 1, $fn=60);
            }

            translate([-30, 105, 37])
            chamfered_cube(80, 25, 6, 1, center=true);

            translate([-30, 105, 22.5])
            chamfered_cube(80, 24, 5, 1, center=true);

            translate([30, 111.2, 37])
            chamfered_cube(80, 15, 6, 1, center=true);

            translate([30, 111.2, 22.5])
            chamfered_cube(80, 15, 5, 1, center=true);

            // end stop mount
            translate([-8.7, 91.7, 38])
            chamfered_cube(16, 8, 8, 1, center=true);
        }
    }

    difference() {
        _y_back_body();

        // PSU mount holes
        translate([65, 95, 8.6])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=50, $fn=20);

        translate([69.9, 95, 8.6])
        rotate([0, 90, 0])
        cylinder(d=8, h=15, $fn=20);

        translate([65, 73, 8.6])
        rotate([0, 90, 0])
        cylinder(d=3.2, h=50, $fn=20);

        translate([69.9, 73, 8.6])
        rotate([0, 90, 0])
        cylinder(d=8, h=15, $fn=20);

        // bottom cuts
        hull() {
            translate([-13, 78, 0])
            cylinder(d=30, h=34, $fn=80);

            translate([-13, 50, 0])
            cylinder(d=30, h=34, $fn=80);

            translate([-28, 78, 0])
            cylinder(d=30, h=34, $fn=80);
        }

        translate([0, 125, 0])
        chamfered_cube(50, 51, 22.8, 5, center=true);

        // motor cuts
        translate([3.29, 82.7, 29])
        rotate([0, 90, 0])
        cylinder(d=23.3, h=40, center=true, $fn=60);

        translate([0, 67.2, 13.5])
        rotate([0, 90, 0])
        cylinder(d=3.4, h=40, center=true, $fn=60);

        translate([-15.9, 67.2, 13.5])
        rotate([0, 90, 0])
        cylinder(d=6.5, h=40, center=true, $fn=60);

        translate([0, 98.2, 13.5])
        rotate([0, 90, 0])
        cylinder(d=3.4, h=40, center=true, $fn=60);

        hull() {
            translate([-15.9, 98.2, 13.5])
            rotate([0, 90, 0])
            cylinder(d=6.5, h=40, center=true, $fn=60);

            translate([-15.9, 98.2, 12.5])
            rotate([0, 90, 0])
            cylinder(d=6.5, h=40, center=true, $fn=60);

        }

        hull() {
            translate([-28.2, 98.2, 13.5])
            rotate([0, 90, 0])
            cylinder(d=6.5, h=40, center=true, $fn=60);

            translate([-28.2, 98.2, 3.5])
            rotate([0, 90, 0])
            cylinder(d=6.5, h=40, center=true, $fn=60);
        }

        translate([0, 98.2, 44.5])
        rotate([0, 90, 0])
        cylinder(d=3.4, h=40, center=true, $fn=60);

        translate([-15.9, 98.2, 44.5])
        rotate([0, 90, 0])
        cylinder(d=6.5, h=40, center=true, $fn=60);

        // endstop holes
        translate([-13.55, 93.7, 36])
        cylinder(d=1.65, h=20, $fn=20);

        translate([-3.95, 93.7, 36])
        cylinder(d=1.65, h=20, $fn=20);

        // dove grooves
        translate([-152/2 - 18/2 + 15, 30, -0.001])
        rotate([0, 0, 90])
        male_dovetail(15);

        translate([-152/2 - 18/2 + 15, 60, -0.001])
        rotate([0, 0, 90])
        male_dovetail(15);

        translate([-152/2 - 18/2 + 15, 90, -0.001])
        rotate([0, 0, 90])
        male_dovetail(15);
    }

//    %translate([0, 111.7, 0])
//    _orig_y_back();
}

module _support_form(w, l, h, top=1, bottom=0.25) {

    slot_w = w - 0.5;
    slot_l = l - 0.5;
    slot_h = h - top - bottom;

    slots = floor(slot_l/6);
    echo(slots);
    slot = (slot_l - slots*0.5 - 0.5)/slots;
    echo(slot);
    
    difference() {
        translate([0, 0, h/2])
        cube([slot_w, slot_l, h], center=true);

        translate([0, -l/2 + 0.5 + slot/2, slot_h/2 + bottom])
        for(i = [0: slots -1]) {
            translate([
                i%2 ? 0.5 : -0.5, i*(slot + 0.5), 0
            ])
            cube([slot_w, slot, slot_h], center=true);
        }
    }

    translate([0, 0, h - top/2])
    cube([w, l, top], center=true);
}
//!_support_form(20, 100, 20, top=1, bottom=0.25);


module _supports_form_y_front() {
    difference() {
        union() {

            translate([0, 205, 0])
            rotate([0, 0, 90])
            _support_form(8, 104, 11.4);

            translate([1.5, 190.5, 0])
            rotate([0, 0, 90])
            _support_form(21, 24, 11.4);

            translate([0, 10/2 - 0.2, 0])
            rotate([0, 0, 90])
            _support_form(12, 112, 8);

            translate([20.25, 105.9, 0])
            _support_form(13.5, 190.4, 11.4);

            translate([-17.25, 105.9, 0])
            _support_form(13.5, 190.4, 11.4);

            translate([62, 105.9, 0])
            _support_form(15, 190.2, 20);

            translate([-62, 105.9, 0])
            _support_form(15, 190.2, 20);

            translate([-39.25, 193.3, 0])
            rotate([0, 0, 90])
            _support_form(15.5, 30.8, 20);

            translate([40.8, 193.3, 0])
            rotate([0, 0, 90])
            _support_form(15.5, 27.5, 20);

            // slots
            translate([-31.5, 193.3, 25.5])
            rotate([0, 0, 90])
            _support_form(15, 40, 8.5, bottom=0.5);

            translate([33, 193.3, 25.5])
            rotate([0, 0, 90])
            _support_form(15, 37, 8.5, bottom=0.5);

            translate([1.5, 193.3, 25.5])
            _support_form(10, 15, 8.5, bottom=0.5);

            // dove groove supports
            translate([-152/2 - 18/2, 208/2, 3/2])
            cube([3, 208, 3], center=true);

            translate([-152/2 - 18/2, 208/2, 0])
            hull() {
                translate([0, 0, 5.25 - 0.5/2])
                cube([7.5, 208, 0.5], center=true);

                translate([0, 0, 2])
                cube([3, 208, 0.1], center=true);
            }

            translate([152/2 + 18/2, 208/2, 3/2])
            cube([3, 208, 3], center=true);

            translate([152/2 + 18/2, 208/2, 0])
            hull() {
                translate([0, 0, 5.25 - 0.5/2])
                cube([7.5, 208, 0.5], center=true);

                translate([0, 0, 2])
                cube([3, 208, 0.1], center=true);
            }
        }

        //new_improved_y_front();
    }
    //%new_improved_y_front();
}

module new_improved_y_front_soluble_supports() {
    intersection() {
        _supports_form_y_front();

        union() {
            translate([0, 0, 34])
            cube([1000, 1000, 1], center=true);

            translate([0, 0, 25.5 + 0.25/2])
            cube([1000, 1000, 0.25], center=true);

            translate([0, 0, 20])
            cube([1000, 1000, 1], center=true);

            translate([0, 206.1, 11.4 - 0.5/2])
            cube([110, 10, 0.5], center=true);

            translate([1.5, 106.1, 11.4 - 0.5/2])
            cube([52, 200, 0.5], center=true);

            translate([0, 10/2, 8 - 0.5/2])
            cube([112, 12, 0.5], center=true);

            translate([152/2 + 18/2, 100, 5])
            cube([10, 220, 0.5], center=true);

            translate([-152/2 - 18/2, 100, 5])
            cube([10, 220, 0.5], center=true);
        }
    }
//    //%_supports_form_y_front();
}

module _supports_form_y_back() {
    difference() {
        union() {
            translate([0, 10/2 - 0.3, 0])
            rotate([0, 0, 90])
            _support_form(12, 112, 8);

            translate([0, 119.7, 0])
            rotate([0, 0, 90])
            _support_form(7.4, 104, 11.4);

            translate([-0.5, 110.25, 0])
            rotate([0, 0, 90])
            _support_form(11.5, 24, 11.4);

            translate([7, 43.6, 0])
            _support_form(10, 66, 8);

            difference() {
                translate([0.5, 90.5, 0])
                _support_form(26, 28, 8);

                translate([-25.5, 70, 0])
                rotate([0, 0, 41])
                cube([50, 100, 60], center=true);
            }

            translate([60.5, 63.4, 0])
            _support_form(18, 105.5, 20);

            translate([31.5, -12/2 + 116.1, 0])
            rotate([0, 0, 90])
            _support_form(12, 40, 20);

            translate([-32, -24/2 + 116.1, 0])
            rotate([0, 0, 90])
            _support_form(24, 39, 20);

            translate([-60.5, 63.4, 0])
            _support_form(18, 105.5, 20);

            // slots
            translate([
                -39/2 - 12.5, -21.5/2 + 116, 25
            ])
            rotate([0, 0, 90])
            _support_form(21.7, 39, 9, bottom=0.5);

            translate([
                40/2 + 11.5, -11.4/2 + 116, 25
            ])
            rotate([0, 0, 90])
            _support_form(11.4, 40, 9, bottom=0.5);

            // dove grooves
            translate([-152/2 - 18/2, 123/2, 3/2])
            cube([3, 123, 3], center=true);

            translate([-152/2 - 18/2, 123/2, 0])
            hull() {
                translate([0, 0, 5.25 - 0.5/2])
                cube([7.5, 123, 0.5], center=true);

                translate([0, 0, 2])
                cube([3, 123, 0.1], center=true);
            }

            translate([152/2 + 18/2, 123/2, 3/2])
            cube([3, 123, 3], center=true);

            translate([152/2 + 18/2, 123/2, 0])
            hull() {
                translate([0, 0, 5.25 - 0.5/2])
                cube([7.5, 123, 0.5], center=true);

                translate([0, 0, 2])
                cube([3, 123, 0.1], center=true);
            }

        }
        new_improved_y_back();
    }

    //%new_improved_y_back();
}

module new_improved_y_back_soluble_supports() {
    intersection() {
        _supports_form_y_back();

        union() {
            translate([0, 0, 34])
            cube([1000, 1000, 1], center=true);

            translate([0, 0, 25])
            cube([1000, 1000, 0.25], center=true);

            translate([0, 0, 20 - 0.5/2])
            cube([1000, 1000, 0.5], center=true);

            translate([0, 10/2, 8 - 0.5/2])
            cube([112.01, 12.01, 0.5], center=true);

            translate([0, 119.7, 11.4 - 0.5/2])
            cube([105.01, 7.41, 0.5], center=true);

            translate([-0.5, 112, 11.4 - 0.5/2])
            cube([24.01, 17.01, 0.5], center=true);

            translate([0.5, 98.7, 8 - 0.5/2])
            cube([26, 11.51, 0.5], center=true);

            translate([7, 52, 8 - 0.5/2])
            cube([10.01, 90.01, 0.5], center=true);

            hull() {
                translate([7, 77, 8 - 0.5/2])
                cube([10.01, 1, 0.5], center=true);

                translate([0.5, 93, 8 - 0.5/2])
                cube([25.01, 1, 0.5], center=true);
            }

            translate([152/2 + 18/2, 100, 5])
            cube([10, 220, 0.5], center=true);

            translate([-152/2 - 18/2, 100, 5])
            cube([10, 220, 0.5], center=true);
        }
    }
    //%_supports_form_y_back();
}

module new_improved_y_back_supports() {

    h = 0.25;

    render()
    difference() {
        _supports_form_y_back();

        new_improved_y_back_soluble_supports();
    }
}

module new_improved_y_front_supports() {
    h = 0.25;

    render()
    difference() {
        _supports_form_y_front();

        new_improved_y_front_soluble_supports();
    }
}
