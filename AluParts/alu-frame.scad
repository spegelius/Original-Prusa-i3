
module frame() {
    difference() {
        linear_extrude(6.3, convexity=10) import("alu-frame.dxf");
        translate([56,55,-10]) cube([250,271,30]);
    }
}

module bed_carriage() {
    translate([-60,-105,0]) intersection() {
        linear_extrude(6.3, convexity=10) import("alu-frame.dxf");
        translate([56,55,-10]) cube([250,271,30]);
    }
}

bed_carriage();