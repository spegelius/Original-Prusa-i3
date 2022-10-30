include <../../../Dollo/NEW_long_ties/include.scad>;
use <../../../Dollo/NEW_long_ties/mockups.scad>;
use <../../../lib/bearings.scad>;


stl_path = "../STL/";


//mockup();
//new_extruder_body();
new_extruder_lid();


module mock_bondtech_gear() {
    difference() {
        union() {
            cylinder(d=8, h=14, $fn=40);
            for (i=[0:16]) {
                rotate([0, 0, 360/17*i])
                translate([9.5/2 - 2/2, 0, 4.8/2])
                cube([2, 0.8, 4.8], center=true);
            }
        }
        cylinder(d=5, h=30, center=true, $fn=40);

        translate([0, 0, 11])
        donut(11.5, 4);
    }
}

module mockup() {
    intersection() {
        union() {
//            import(
//                str(stl_path, "extruder-body.stl"),
//                convexity=10
//            );

            new_extruder_body();

//            translate([-46, 36.5, 28.1])
//            rotate([0, 180, 0])
//            import(
//                str(stl_path, "extruder-motor-plate.stl"),
//                convexity=10
//            );

            translate([42, 52, 17])
            rotate([0, 90, 180])
            new_extruder_lid();
//            import(
//                str(stl_path, "extruder-idler.stl"),
//                convexity=10
//            );

//            %translate([-4, 15.35, 48])
//            rotate([-90, 0, 0])
//            mock_stepper_motor();

            translate([-4, 36.5, 1])
            MR105zz();

//            translate([-4, 36.5, 6])
//            mock_bondtech_gear();
        }
//
//        translate([70/2 -4, 0, 0])
//        cube([70, 200, 100], center=true);
    }
}

module new_extruder_body() {
    difference() {
        union() {
            import(
                str(stl_path, "extruder-body.stl"),
                convexity=10
            );

            translate([-5, 36.5, 5.7/2])
            cube([12, 16, 5.7], center=true);
        }

        translate([-4, 36.5, -0.5])
        difference() {
            cylinder(d=10.2, h=7.6, $fn=60);

            for(i = [0:4]) {
                rotate([0, 0, 360/5*i + 35])
                translate([11/2 + 0.1, 0, -1])
                cylinder(d=1.3, h=13, $fn=20);
            }
        }
    }

    translate([-4, 36.5, 5.2])
    intersection() {
        donut(10.7, 1, $fn=60);

        translate([-0.5, 0, 0])
        cube([11, 20, 20], center=true);
    }
}

module new_extruder_lid() {
    difference() {
        import(
            str(stl_path, "extruder-idler.stl"),
            convexity=10
        );

        translate([40/2, 0, 10/2 + 40.4])
        cube([40, 40, 10], center=true);
    }
}