
module mock_LM8UU() {
    color("silver") difference() {
        cylinder(d=15,h=24,center=true,$fn=30);
        cylinder(d=8,h=25,center=true,$fn=30);
    }
}

module mock_PSU_240W() {
    color("silver") difference() {
        cube([110,199,50]);
        translate([-1,-1,24]) cube([110,12,50]);
        translate([-1,-1,11]) cube([12,12,50]);
        
        translate([111,19.5,25]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([111,19.5+150.7,12]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([111,19.5+150.7,50-13]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        
        translate([10,61,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([110-15,61,-0.1]) cylinder(d=3,h=10,$fn=20);
        
        translate([10,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([110-15,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);

    }
}

mock_PSU_240W();