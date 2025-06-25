use <../../AluParts/alu-frame.scad>;
use <mockups.scad>;
use <../../Dollo/NEW_long_ties/include.scad>;
include <../../Dollo/NEW_long_ties/globals.scad>;
use <y-belt-holder.scad>;
use <heatbed_cable_cover.scad>;


stl_base_path = "../../../_downloaded/";
spath = str(
    stl_base_path, "Prusa/LM8UU/"
);

//_lm8uu_clip();
//_original_bed_carriage();

//debug();
//debug_magnetic();

bed_carriage();
//bed_carriage_small();

//bed_carriage_arm();

//bed_carriage_spacer();
//bed_carriage_spacer_center();

//bed_carriage_spacer(7.6);
//bed_carriage_spacer_center(7.6);

//bed_carriage_spacer(10);
//bed_carriage_spacer_center(10);

//bed_carriage_magnet_tray();

//bed_carriage_spacer_magnet(h=7.6);


module _lm8uu_clip() {
    lm8uu_clip = 
        "LM8UU_Clip_V2_CompleteSet_ScrewFromTopOnly(2).stl";

        import(
        str(
            spath,
            lm8uu_clip
        ),
        convexity=10
    );
}

module _original_bed_carriage() {
    translate([0, 220, 6.3])
    rotate([180, 0, 0])
    orig_bed_carriage();

    color("red") {
        bolt_holes(d=1, h=20);

        translate([25, 75, 0])
        cube([10, 10, 10], center=true);

        bearing_holes();
    }

    translate([254/2 - 17, 235/2 - 4.5, 12])
    mock_bed_MK42();
}


module debug() {

//    color("grey")
//    translate([
//        -220/2 + 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, 45])
//    bed_carriage_arm();
//
//    color("grey")
//    translate([
//        220/2 - 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, -45])
//    bed_carriage_arm();
//
//    color("grey")
//    mirror([0, 1, 0])
//    translate([
//        -220/2 + 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, 45])
//    bed_carriage_arm();
//
//    color("grey")
//    mirror([0, 1, 0])
//    translate([
//        220/2 - 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, -45])
//    bed_carriage_arm();

    translate([220/2, -220/2, 0])
    rotate([0, 180, 0])
    bed_carriage();

    translate([220/2 + 80.6, -220/2 + 82.5, 56.92])
    rotate([-90, 0, 180])
    {
        _lm8uu_clip();

        translate([105.65, 71.4, 7.5])
        mock_LM8UU();
    }

    %translate([7.5, 17, -35])
    rotate([90, 0, -90])
    //y_belt_holder();
    y_belt_holder_printed_carriage();

    %translate([10, 2, -9])
    rotate([180, 0, 90])
    y_belt_holder_printed_carriage_2();

    //%translate([11, 61, 7])
    //qnd_bearing_fix();

    //%translate([220/2 - 8.5, 220/2 - 33.1, 7])
    //qnd_belt_holder_fix();
    
    translate([-1.5, 3, 5])
    mock_bed_MK42(mount_holes=true);


}

module debug_magnetic() {

//    color("grey")
//    translate([
//        -220/2 + 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, 45])
//    bed_carriage_arm();
//
//    color("grey")
//    translate([
//        220/2 - 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, -45])
//    bed_carriage_arm();
//
//    color("grey")
//    mirror([0, 1, 0])
//    translate([
//        -220/2 + 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, 45])
//    bed_carriage_arm();
//
//    color("grey")
//    mirror([0, 1, 0])
//    translate([
//        220/2 - 5.5, -220/2 + 220 - 5.5, 7/2 - 7
//    ])
//    rotate([0, 0, -45])
//    bed_carriage_arm();

//    translate([220/2, -220/2, 0])
//    rotate([0, 180, 0])
//    bed_carriage();

//    translate([220/2 + 80.6, -220/2 + 82.5, 56.92])
//    rotate([-90, 0, 180])
//    {
//        _lm8uu_clip();
//
//        translate([105.65, 71.4, 7.5])
//        mock_LM8UU();
//    }

    %translate([7.5, 17, -35])
    rotate([90, 0, -90])
    y_belt_holder();

    translate([-108.5, 119.80, 10])
    heatbed_cable_cover();
    
    translate([-1.5, 3, 10])
    mock_bed_MK42(mount_holes=true);

//    color("lightgrey")
//    translate([0, 0, 13])
//    mock_steel_sheet();

    translate([-1.5, 0, 7])
    bed_carriage_magnet_tray();
}


module bolt_holes(
    d=bolt_hole_dia, h=10, bearing=true
) {
    // corners
    translate([5.5, 5.5, 0])
    cylinder(d=d, h=h);

    translate([5.5, 220 - 5.5, 0])
    cylinder(d=d, h=h);

    translate([220 - 5.5, 5.5, 0])
    cylinder(d=d, h=h);

    translate([220 - 5.5, 220 - 5.5, 0])
    cylinder(d=d, h=h);

    // bearing screw holes
    if (bearing) {
        translate([15, 75, 0])
        cylinder(d=d, h=h);

        translate([15, 220 - 75, 0])
        cylinder(d=d, h=h);

        translate([35, 75, 0])
        cylinder(d=d, h=h);

        translate([35, 220 - 75, 0])
        cylinder(d=d, h=h);

        translate([220 - 15, 220/2, 0])
        cylinder(d=d, h=h);

        translate([220 - 35, 220/2, 0])
        cylinder(d=d, h=h);
    }

    // center holes
    translate([220/2, 220 - 89, 0])
    cylinder(d=d, h=h);

    translate([220/2, 90, 0])
    cylinder(d=d, h=h);
}

module bearing_holes() {
    side = sqrt(2*5*5);

    module hole() {
        hull() {
            translate([0, 0, -5])
            rotate([0, 45, 0])
            cube([side, 24.2, side],center=true);

            translate([0, 0, 5])
            rotate([0, 45, 0])
            cube([side, 24.2, side], center=true);
        }
    }

    top = 14;
    bottom = -5;

    translate([25, 75, top])
    hole();

    //translate([25, 75, bottom])
    //hole();

    translate([25, 220 - 75, top])
    hole();

    //translate([25, 220 - 75, bottom])
    //hole();

    translate([220 - 25, 220/2, top])
    hole();

    //translate([220 - 25, 220/2, bottom])
    //hole();
}

module _bed_carriage_body() {
    difference() {

        union() {
            //#translate([0, 10, 0])
            //cube([220, 200, 7]);
            rounded_cube_side(
                220, 220, 7, 11, $fn=40
            );

            // bearing studs
            translate([11, 61, 7])
            rounded_cube_side(28, 28, 2, 3, $fn=30);

            translate([11, 131, 7])
            rounded_cube_side(28, 28, 2, 3, $fn=30);

            translate([220 - 11 - 28, 96, 7])
            rounded_cube_side(28, 28, 2, 3, $fn=30);

            // Y belt holder stud
            translate([
                220/2 - 8.5, 220/2 - 33.1, 7
            ])
            difference() {
                union() {
                    rounded_cube_side(
                        15, 68, 3.3, 4, $fn=30
                    );

                    translate([-7, 14, 0])
                    rounded_cube_side(
                        29, 10, 3.5, 3, $fn=30
                    );

                    translate([-7, 45, 0])
                    rounded_cube_side(
                        29, 10, 3.5, 3, $fn=30
                    );
                }

                translate([-15, 8, 2])
                cube([50, 52.2, 10]);

                translate([0, 0, 8])
                rotate([40, 0, 0])
                cube([31, 15, 15], center=true);

                translate([0, 68, 8])
                rotate([50, 0, 0])
                cube([31, 15, 15], center=true);
            }

        }

        translate([0, 0, -0.1])
        bolt_holes(bearing=false, $fn=20);

        translate([0, 0, -0.1])
        bolt_holes(d=2.8, $fn=20);

        translate([0, 0, 7 - 1.5])
        bolt_holes(d=7.5, bearing=false, $fn=20);

        bearing_holes();

        // Y belt holder mount holes
        translate([119.5, 97, 0])
        cylinder(d=2.8, h=30, center=true, $fn=20);

        translate([119.5, 126, 0])
        cylinder(d=2.8, h=30, center=true, $fn=20);

        translate([98, 96, 0])
        cylinder(d=2.8, h=30, center=true, $fn=20);

        translate([98, 128, 0])
        cylinder(d=2.8, h=30, center=true, $fn=20);
        
        translate([40, 180, 0])
        sphere(d=3, $fn=10);

        translate([65, 220/2, -0.1])
        cylinder(d=50, h=10);

        translate([220 - 70, 220/2, -0.1])
        cylinder(d=45, h=10);

        translate([220 - 50, 60, -0.1])
        cylinder(d=20, h=10);

        translate([220 - 50, 220 - 60, -0.1])
        cylinder(d=20, h=10);

        translate([50, 60, -0.1])
        cylinder(d=20, h=10);

        translate([50, 220 - 60, -0.1])
        cylinder(d=20, h=10);

        difference() {
            translate([220/2, 0, 0])
            hull() {
                translate([0, 221])
                cube([161, 2, 20], center=true);

                translate([0, 159])
                cube([24, 2, 20], center=true);
            }

            translate([50, 220 - 25 - 10, 0])
            cube([120, 10, 7]);
        }

        difference() {
            translate([220/2, 0, 0])
            hull() {
                translate([0, -1])
                cube([161, 1, 20], center=true);

                translate([0, 62])
                cube([24, 1, 20], center=true);
            }

            translate([50, 25, 0])
            cube([120,10,7]);
        }

        translate([-12, 175, 0])
        rotate([0, 0, 45])
        cube([40, 40, 20], center=true);

        translate([-12, 45, 0])
        rotate([0, 0, 45])
        cube([40, 40, 20], center=true);

        translate([5 + 220, 167, 0])
        rotate([0, 0, 45])
        cube([40, 40, 20], center=true);

        translate([5 + 220, 53, 0])
        rotate([0, 0, 45])
        cube([40, 40, 20], center=true);

        translate([0, 220/2, 0])
        cube([20, 120, 20], center=true);

        translate([220, 220/2, 0])
        cube([20, 110, 20], center=true);

        // hidden infill
        #translate([220/2, 220/2, 7/2])
        rotate([90, 0, 38]) {
            translate([0, 1.5, 0])
            cylinder(d=0.25, h=300, center=true);

            cylinder(d=0.25, h=300, center=true);

            translate([0, -1.5, 0])
            cylinder(d=0.25, h=300, center=true);
        }

        #translate([220/2, 220/2, 7/2])
        rotate([90, 0, -38]) {
            translate([0, 1.5, 0])
            cylinder(d=0.25, h=300, center=true);

            cylinder(d=0.25, h=300, center=true);

            translate([0, -1.5, 0])
            cylinder(d=0.25, h=300, center=true);
        }
        #translate([220/2, 220/2 - 30, 7/2])
        rotate([0, 90, 0]) {
            translate([1.5, 0, 0])
            cylinder(d=0.25, h=300, center=true);

            cylinder(d=0.25, h=300, center=true);

            translate([-1.5, 0, 0])
            cylinder(d=0.25, h=300, center=true);
        }

        #translate([220/2, 220/2 + 30, 7/2])
        rotate([0, 90, 0]) {
            translate([1.5, 0, 0])
            cylinder(d=0.25, h=300, center=true);

            cylinder(d=0.25, h=300, center=true);

            translate([-1.5, 0, 0])
            cylinder(d=0.25, h=300, center=true);
        }
    }
}

module bed_carriage() {
    difference() {
        union() {
            _bed_carriage_body();
        }

        translate([-6, 22, 0])
        rotate([0, 0, -20])
        cube([20, 50, 20], center=true);

        translate([-6, 220 - 22, 0])
        rotate([0, 0, 20])
        cube([20, 50, 20], center=true);

        translate([220 + 6, 22, 0])
        rotate([0, 0, 20])
        cube([20, 50, 20], center=true);

        translate([220 + 6, 220 - 22, 0])
        rotate([0, 0, -20])
        cube([20, 50, 20], center=true);

        translate([22, -6, 0])
        rotate([0, 0, 20])
        cube([60, 20, 20], center=true);

        translate([22, 220 + 6, 0])
        rotate([0, 0, -20])
        cube([60, 20, 20], center=true);

        translate([220 - 22, -6, 0])
        rotate([0, 0, -20])
        cube([60, 20, 20], center=true);

        translate([220 - 22, 220 + 6, 0])
        rotate([0, 0, 20])
        cube([60, 20, 20], center=true);
    }
}

module bed_carriage_small() {

    module arm_coutout() {
        _bed_arm_body();

        translate([-20, bed_arm_hole_pos, 0])
        rotate([0, 90, 0])
        cylinder(d=bolt_hole_dia, h=40, $fn=20);

        translate([-18.2, bed_arm_hole_pos, 0])
        rotate([0, -90, 0])
        M3_nut(3);

        translate([18, bed_arm_hole_pos, 0])
        rotate([0, 90, 0])
        cylinder(d=bolt_head_hole_dia, h=80, $fn=20);
    }

    difference() {
        intersection() {
            _bed_carriage_body();

            translate([220/2, 220/2, 9/2])
            rotate([0, 0, 45])
            cube([285, 285, 13], center=true);

            translate([0, 10, 0])
            cube([220, 200, 10]);
        }

        translate([5.5, 220 - 5.5, 7/2])
        rotate([0, 0, 45])
        arm_coutout();

        translate([5.5, 5.5, 7/2])
        rotate([0, 0, 135])
        arm_coutout();

        translate([220 - 5.5, 5.5, 7/2])
        rotate([0, 0, 225])
        arm_coutout();

        translate([220 - 5.5, 220 - 5.5, 7/2])
        rotate([0, 0, -45])
        arm_coutout();


    }
}

bed_arm_l = 40;
bed_arm_hole_pos = -bed_arm_l/2-10;

module _bed_arm_body(length=bed_arm_l) {
    side = sqrt(2*3.51*3.51); 
    hull() {
        cylinder(d=10, h=7, center=true);

        translate([-7, -length/2 - 5, 0])
        rotate([0, 45, 0])
        cube([side, length, side], center=true);

        translate([7, -length/2 - 5, 0])
        rotate([0, 45, 0])
        cube([side, length, side], center=true);

        translate([0, -length - 5 - 7/2 + 1/2, 0])
        cube([14, 1, .2], center=true);
    }
}

module bed_carriage_arm() {
    difference() {
        _bed_arm_body(bed_arm_l - 0.2);

        translate([0, 0, -0.1])
        cylinder(
            d=bolt_hole_dia, h=10, center=true, $fn=20
        );

        translate([0, 0, 7])
        cylinder(
            d=bolt_head_hole_dia, h=10,
            center=true, $fn=20
        );

        //translate([0, -bed_arm_l, 0])
        //cube([2, 21, 10], center=true);

        translate([-20, bed_arm_hole_pos, 0])
        rotate([0, 90, 0])
        cylinder(d=bolt_hole_dia, h=60, $fn=20);
    }
}

module bed_carriage_spacer(h=7) {
    difference() {
        cylinder(d=12 + slop, h=h, $fn=6);

        translate([0, 0, h - 4])
        cylinder(d=6 + slop, h=h, $fn=6);

        translate([0, 0, -0.1])
        cylinder(d=bolt_hole_dia, h=h, $fn=20);
    }
}

module bed_carriage_spacer_magnet(h=7) {
    difference() {
        cylinder(d=15 + slop, h=h, $fn=6);

        translate([0, 0, h - 1.8])
        cylinder(d=6 + slop, h=h, $fn=6);

        translate([0, 0, -0.1])
        cylinder(d=bolt_hole_dia, h=h, $fn=20);
    }
}

module bed_carriage_spacer_center(h=7) {
    union() {
        bed_carriage_spacer(h=h);

        tube(14, 4, 3, $fn=6);
    }
}

module bed_carriage_magnet_tray() {
    module _magnet_cut_big() {
        translate([0, 0, 3/2 + 0.5])
        cube([31, 8, 3], center=true);

        translate([31/2 - 2/2, 0, 0])
        cube([2, 10, 8], center=true);

        translate([-31/2 + 2/2, 0, 0])
        cube([2, 10, 8], center=true);
    }

    module _magnet_cut_small() {
        translate([0, 0, 3/2 + 1])
        cube([21, 7, 3], center=true);

        translate([21/2 - 2/2, 0, 0])
        cube([2, 9, 8], center=true);

        translate([-21/2 + 2/2, 0, 0])
        cube([2, 9, 8], center=true);
    }

    module _magnet_big_cuts() {
        // bottom row
        translate([-84.5, -106, 0])
        _magnet_cut_big();

        translate([-54.5, -106, 0])
        _magnet_cut_big();

        translate([87.5, -106, 0])
        _magnet_cut_big();

        translate([57.5, -106, 0])
        _magnet_cut_big();

        translate([1, -106, 0])
        _magnet_cut_big();

        // top row
        translate([-90, 113, 0])
        _magnet_cut_big();

        translate([-60, 113, 0])
        _magnet_cut_big();

        translate([90, 113, 0])
        _magnet_cut_big();

        translate([60, 113, 0])
        _magnet_cut_big();

        translate([0, 113, 0])
        _magnet_cut_big();

        // left
        translate([-120, -95, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([-120, -65, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([-120, 101, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([-120, 71, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([-120, 3, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        // right
        translate([120, -95, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([120, -65, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([120, 101, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([120, 71, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([120, 3, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        // rotated
        translate([48, 56, 0])
        rotate([0, 0, 45])
        _magnet_cut_big();

        translate([-48, -53, 0])
        rotate([0, 0, 45])
        _magnet_cut_big();

        translate([-48, 56, 0])
        rotate([0, 0, -45])
        _magnet_cut_big();

        translate([48, -53, 0])
        rotate([0, 0, -45])
        _magnet_cut_big();

        //center
        translate([53, 3, 0])
        _magnet_cut_big();

        translate([-53, 3, 0])
        _magnet_cut_big();

        translate([0, 56, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();

        translate([0, -53, 0])
        rotate([0, 0, 90])
        _magnet_cut_big();
    }

    module _magnet_small_cuts() {
        // bottom row
        translate([-72, -85, 0])
        _magnet_cut_small();

        translate([72, -85, 0])
        _magnet_cut_small();

        translate([0, -85, 0])
        _magnet_cut_small();

        // top row
        translate([-72, 92, 0])
        _magnet_cut_small();

        translate([72, 92, 0])
        _magnet_cut_small();

        translate([0, 92, 0])
        _magnet_cut_small();

        // left
        translate([-96, -60, 0])
        rotate([0, 0, 90])
        _magnet_cut_small();

        translate([-96, 3, 0])
        rotate([0, 0, 90])
        _magnet_cut_small();

        translate([-96, 63, 0])
        rotate([0, 0, 90])
        _magnet_cut_small();

        translate([96, -60, 0])
        rotate([0, 0, 90])
        _magnet_cut_small();

        translate([96, 3, 0])
        rotate([0, 0, 90])
        _magnet_cut_small();

        translate([96, 63, 0])
        rotate([0, 0, 90])
        _magnet_cut_small();

        // rotated
        translate([66, 31, 0])
        rotate([0, 0, 30])
        _magnet_cut_small();

        translate([-66, -27, 0])
        rotate([0, 0, 30])
        _magnet_cut_small();

        translate([-66, 31, 0])
        rotate([0, 0, -30])
        _magnet_cut_small();

        translate([66, -27, 0])
        rotate([0, 0, -30])
        _magnet_cut_small();

        translate([27, 72, 0])
        rotate([0, 0, 60])
        _magnet_cut_small();

        translate([-27, 72, 0])
        rotate([0, 0, -60])
        _magnet_cut_small();

        translate([27, -69, 0])
        rotate([0, 0, -60])
        _magnet_cut_small();

        translate([-27, -69, 0])
        rotate([0, 0, 60])
        _magnet_cut_small();
    }
    

    difference() {
        translate([0, 0, (3 + 5)/2])
        rounded_cube_side(
            258.5, 245.5, 3 + 5, 14.5, center=true, $fn=30
        );

        translate([0, 0, 6/2 + 3])
        rounded_cube_side(
            254.5, 241.5, 6, 11, center=true, $fn=30
        );

        translate([0, -134.5, 0])
        cube([300, 40, 20], center=true);

        translate([-110.5, 140.5, 0])
        cube([40, 40, 20], center=true);

        translate([-111.3, 140.5 - 3, 20/2 + 2.4 + 3])
        cube([30, 40, 20], center=true);

        translate([-259/2, -116, 0])
        rotate([0, 0, 45])
        cube([10, 10, 20], center=true);

        translate([259/2, -116, 0])
        rotate([0, 0, 45])
        cube([10, 10, 20], center=true);

        translate([15, 120, 30/2 + 5.4])
        chamfered_cube(
            160, 30, 30, 6, center=true
        );

        translate([0, 4, 30/2 + 5.4])
        chamfered_cube(
            360, 180, 30, 6, center=true
        );

        translate([-220/2 + 1.5, -220/2, -1])
        bolt_holes(d=6.7, bearing=false, $fn=30);

        // thermistor cable cut
        hull() {
            translate([-20, 2, 1])
            cylinder(d=10, h=10, $fn=20);

            translate([-109, 98, 1])
            cylinder(d=8, h=10, $fn=20);
        }

        hull() {
            translate([-109, 120, 1])
            cylinder(d=8, h=10, $fn=20);

            translate([-109, 98, 1])
            cylinder(d=8, h=10, $fn=20);
        }

        _magnet_big_cuts();
        _magnet_small_cuts();
    }
}

// QND FIXES, DO NOT USE
module qnd_bearing_fix() {
    side = sqrt(2*5*5);

    module hole() {
        hull() {
            translate([0, 0, -5])
            rotate([0, 45, 0])
            cube([side, 24.2, side], center=true);

            translate([0, 0, 5])
            rotate([0, 45, 0])
            cube([side, 24.2, side], center=true);
        }
    }
    
    difference() {
        union() {
            rounded_cube_side(29, 28, 2, 4);

            translate([28/2, 28/2, -3])
            scale([1, 0.97, 1])
            hole();
        }
        translate([4, 28/2])
        cylinder(d=3.2, h=5, $fn=30);

        translate([28 - 4, 28/2])
        cylinder(d=3.2, h=5, $fn=30);

        translate([28/2, 28/2, -5])
        hole();
    }
}

module qnd_belt_holder_fix() {
    difference() {
        rounded_cube_side(15, 68, 6, 4, $fn=30);

        translate([-1, 8, 2])
        cube([30, 52.2, 10]);

        translate([0, 0, 8])
        rotate([40, 0, 0])
        cube([30, 10, 10], center=true);

        translate([0, 68, 8])
        rotate([50, 0, 0])
        cube([30, 10, 10], center=true);
        
        translate([15/2, 4, 0])
        cylinder(d=3.2, h=10, $fn=30);

        translate([15/2, 4, 2])
        cylinder(d=6.7, h=10, $fn=30);

        translate([15/2, 68 - 4, 0])
        cylinder(d=3.2, h=10, $fn=30);

        translate([15/2, 68 - 4, 2])
        cylinder(d=6.7, h=10, $fn=30);
        
        translate([15/2 + 1, 13, 0])
        cylinder(d=3.2, h=10, $fn=30);

        translate([15/2 + 1, 67.5 - 13.5, 0])
        cylinder(d=3.2, h=10, $fn=30);
    }
}
//qnd_bearing_fix();
//qnd_belt_holder_fix();
// END QND
