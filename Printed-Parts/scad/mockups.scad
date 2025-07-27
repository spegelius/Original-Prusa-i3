use <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/mockups.scad>;


//mock_LM8UU();
mock_PSU_Prusa();
//mock_40mm_fan();
//mock_bed_MK42(mount_holes=true);
//mock_steel_sheet();


module mock_LM8UU() {
    color("silver") difference() {
        cylinder(d=15, h=24, center=true, $fn=30);
        cylinder(d=8, h=25, center=true, $fn=30);
    }
}

module mock_PSU_Prusa() {
    w = 98.8;
    h = 199;
    d = 48.5;
    
    color("silver")
    difference() {
        cube([w, h, d]);

        // front cuts
        translate([1.7, -1, 24])
        cube([w - 3.4, 17, d]);

        translate([1.7, -1, 11])
        cube([6, 17, d]);

        // right side screw holes
        translate([w + 1, 25, 24])
        rotate([0, -90, 0])
        cylinder(d=3, h=10, $fn=20);

        translate([w + 1, 25, 11.5])
        rotate([0, -90, 0])
        cylinder(d=3, h=10, $fn=20);

        translate([w + 1, h - 57, 11.5])
        rotate([0, -90, 0])
        cylinder(d=3, h=10, $fn=20);

        translate([w + 1, h - 57, d - 12])
        rotate([0, -90, 0])
        cylinder(d=3, h=10, $fn=20);

        // left side screw holes
        #translate([-10, 25, 12])
        rotate([0, 90, 0])
        cylinder(d=3, h=20, $fn=20);

        #translate([-10, h - 57, 12])
        rotate([0, 90, 0])
        cylinder(d=3, h=20, $fn=20);

        // bottom screw holes
        translate([8.3, 22.2, -0.1])
        cylinder(d=3, h=10, $fn=20);

        translate([w - 30, 25, -0.1])
        cylinder(d=3, h=10, $fn=20);

        translate([10, h - 11, -0.1])
        cylinder(d=3, h=10, $fn=20);

        translate([w - 10, h - 11, -0.1])
        cylinder(d=3, h=10, $fn=20);

        // side slots
        hull() {
            translate([-1, 9, 14])
            rotate([0, 90, 0])
            cylinder(d=4, h=4, $fn=20);

            translate([-1, 9, d - 13])
            rotate([0, 90, 0])
            cylinder(d=4, h=4, $fn=20);

        }

        hull() {
            translate([w + 1, 9, 11])
            rotate([0, -90, 0])
            cylinder(d=4, h=4, $fn=20);

            translate([w + 1, 9, d - 13])
            rotate([0, -90, 0])
            cylinder(d=4, h=4, $fn=20);
        }

        translate([w + 1, 9, d - 17.5])
        rotate([0, -90, 0])
        cylinder(d=8, h=10, $fn=20);

    }
}

module mock_40mm_fan() {
    difference() {
        translate([0, 0, 11/2])
        rounded_cube_side(40, 40, 11, 3, center=true);

        translate([0, 0, -0.1])
        cylinder(d=39, h=12, $fn=40);

        for(i=[0:3]) {
            rotate([0, 0, i*360/4])
            translate([32.5/2, 32.5/2, 0])
            cylinder(d=3.5, h=12, $fn=20);
        }
    }
}

module mock_bed_MK42(mount_holes=false) {
    difference() {
        union() {
            translate([0, 0, 3.3/2])
            chamfered_cube_side(
                254, 235, 3.3, 4, center=true
            );

            translate([
                -254/2 + 4 + 29/2,
                235/2 + 15/2 - 0.7,
                3.3/2
            ])
            chamfered_cube_side(
                29, 15, 3.3, 1, center=true
            );

            color("grey")
            translate([-254/2 + 24, -235/2 + 10, -5.2])
            M3_nut(5.2, cone=false);

            color("grey")
            translate([254/2 - 21, -235/2 + 10, -5.2])
            M3_nut(5.2, cone=false);

            color("grey")
            translate([
                -254/2 + 24, -235/2 + 10 + 209, -5.2
            ])
            M3_nut(5.2, cone=false);

            color("grey")
            translate([
                254/2 - 21, -235/2 + 10 + 209, -5.2
            ])
            M3_nut(5.2, cone=false);

            color("grey")
            translate([1.5, -235/2 + 10 + 84.5, -5.2])
            M3_nut(5.2, cone=false);

            color("grey")
            translate([1.5, -235/2 + 10 + 84.5 + 41, -5.2])
            M3_nut(5.2, cone=false);
        }

        translate([
            -254/2 + 4 + 29/2,
            235/2 + 15 - 0.7 - 7.5, 0,
        ])
        cylinder(d=3, h=20, center=true, $fn=20);

        if (mount_holes) {
            translate([-254/2 + 24, -235/2 + 10, -5.2])
            cylinder(d=2, h=30, center=true, $fn=20);

            translate([254/2 - 21, -235/2 + 10, -5.2])
            cylinder(d=2, h=30, center=true, $fn=20);

            translate([
                -254/2 + 24, -235/2 + 10 + 209, -5.2
            ])
            cylinder(d=2, h=30, center=true, $fn=20);

            translate([
                254/2 - 21, -235/2 + 10 + 209, -5.2
            ])
            cylinder(d=2, h=30, center=true, $fn=20);

            translate([1.5, -235/2 + 10 + 84.5, -5.2])
            cylinder(d=2, h=30, center=true, $fn=20);

            translate([1.5, -235/2 + 10 + 84.5 + 41, -5.2])
            cylinder(d=2, h=30, center=true, $fn=20);
        }
    }

    translate([-20, 0, -3/2])
    rotate([-90, 0, 43])
    cylinder(d=3, h=130);

    translate([-109, 95, -3/2])
    rotate([-90, 0, 0])
    cylinder(d=3, h=130);

}

module mock_steel_sheet() {
    difference() {
        translate([0, 0, 0.75/2])
        rounded_cube_side(
            254, 241, 0.75, 10, center=true, $fn=30
        );

        translate([-254/2 + 54, - 241/2 + 5, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        translate([254/2 - 54, - 241/2 + 5, 0])
        cylinder(d=3, h=10, center=true, $fn=20);

        hull() {
            translate([0, 241/2, 0])
            cube([142, 8, 10], center=true);

            translate([0, 241/2 + 0.1/2, 0])
            cube([147, 0.1, 10], center=true);

        }
        

    }
}