use <../../Dollo/NEW_long_ties/include.scad>;
use <../../Dollo/NEW_long_ties/mockups.scad>;


//mock_LM8UU();
//mock_PSU_Prusa();
//mock_PSU_240W();
//mock_PSU_360W();
//mock_40mm_fan();
mock_bed_MK42(mount_holes=true);
//mock_steel_sheet();


module mock_LM8UU() {
    color("silver") difference() {
        cylinder(d=15, h=24, center=true, $fn=30);
        cylinder(d=8, h=25, center=true, $fn=30);
    }
}

module mock_PSU_Prusa() {
    w = 98;
    h = 199;
    d = 49;
    
    color("silver") difference() {
        cube([w, h, d]);

        translate([-1, -1, 24])
        cube([w, 12, d]);

        translate([-1, -1, 11])
        cube([12, 12, d]);
        
        translate([w + 1, 19.5, d/2])
        rotate([0, -90, 0])
        cylinder(d=3, h=10, $fn=20);

        translate([w + 1, 19.5 + 150.7, 12])
        rotate([0, -90, 0])
        cylinder(d=3, h=10, $fn=20);

        translate([w + 1, 19.5 + 150.7, d - 13])
        rotate([0, -90, 0])
        cylinder(d=3, h=10, $fn=20);

        translate([7.5, 16.8, -0.1])
        cylinder(d=3, h=10, $fn=20);

        translate([w - 30.2, 20, -0.1])
        cylinder(d=3, h=10, $fn=20);

        translate([10, 61 + 126, -0.1])
        cylinder(d=3, h=10, $fn=20);

        translate([w -15, 61 + 126, -0.1])
        cylinder(d=3, h=10, $fn=20);
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