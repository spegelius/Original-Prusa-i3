
//orig_frame();
//orig_bed_carriage();

//alu_frame_psu_hole_finder();
alu_frame_360w_psu_hole_drill_jig();


module orig_frame() {
    difference() {
        linear_extrude(6.3, convexity=10)
        import("alu-frame.dxf");

        translate([56, 55, -10])
        cube([250, 271, 30]);

        translate([4.95, 269.5, 0])
        cylinder(d=2.8, h=20, center=true, $fn=20);

        translate([4.95 + 43, 269.5,0])
        cylinder(d=2.8, h=20, center=true, $fn=20);

        // PSU mount holes
        translate([330, 80, 0])
        cylinder(d=4.5, h=20, center=true, $fn=30);

        translate([330, 196.5, 0])
        cylinder(d=4.5, h=20, center=true, $fn=30);

        // PSU mount holes 360W
        translate([328.7, 88, 0])
        cylinder(d=4.5, h=20, center=true, $fn=30);

        translate([328.7, 239, 0])
        cylinder(d=4.5, h=20, center=true, $fn=30);
    }
}

module orig_bed_carriage() {
    translate([-60, -105, 0])
    intersection() {
        linear_extrude(6.3, convexity=10)
        import("alu-frame.dxf");

        translate([58, 100, -10])
        cube([230, 226, 30]);
    }
}

module alu_frame_psu_hole_finder() {
    %translate([-312, -138, 1])
    orig_frame();

    difference() {
        union() {
            translate([3/2, 0, 6/2])
            cube([3, 130, 6], center=true);

            translate([23/2, 0, 1/2])
            cube([23, 130, 1], center=true);

            hull() {
                translate([-6, -87.5, 6/2])
                cube([3, 1, 6], center=true);

                translate([3/2, -64.5, 6/2])
                cube([3, 1, 6], center=true);
            }

            hull() {
                translate([0, -87.5, 1/2])
                cube([10, 1, 1], center=true);

                translate([10/2, -64.5, 1/2])
                cube([10, 1, 1], center=true);
            }
        }

        translate([18.1, -58, 0])
        cylinder(d=4, h=20, center=true, $fn=40);

        translate([18.1, 58.5, 0])
        cylinder(d=4, h=20, center=true, $fn=40);
    }
}

module alu_frame_360w_psu_hole_drill_jig() {
    %translate([-312, -158, 10])
    orig_frame();

    difference() {
        translate([25/2, 0, 15/2])
        cube([25, 169, 15], center=true);

        translate([25/2 + 3, 0, 10 + 15/2])
        cube([25, 182, 15], center=true);

        translate([18.1, -78, 0])
        cylinder(d=4.2, h=50, center=true, $fn=30);

        translate([18.1, 38.5, 0])
        cylinder(d=4.2, h=50, center=true, $fn=30);

        translate([16.8, -70, 0])
        cylinder(d=2, h=50, center=true, $fn=30);

        translate([16.8, 81, 0])
        cylinder(d=2, h=50, center=true, $fn=30);
        
    }
}