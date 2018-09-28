
module mock_LM8UU() {
    color("silver") difference() {
        cylinder(d=15,h=24,center=true,$fn=30);
        cylinder(d=8,h=25,center=true,$fn=30);
    }
}

module _mock_PSU(w,h,d) {
    color("silver") difference() {
        cube([w,h,d]);
        translate([-1,-1,24]) cube([w,12,d]);
        translate([-1,-1,11]) cube([12,12,d]);
        
        translate([w+1,19.5,d/2]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([w+1,19.5+150.7,12]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([w+1,19.5+150.7,d-13]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        
        translate([10,61,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([w-15,61,-0.1]) cylinder(d=3,h=10,$fn=20);
        
        translate([10,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([w-15,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);
    }
}

module mock_PSU_Prusa() {
    w = 98;
    h = 199;
    d = 49;
    
    color("silver") difference() {
        cube([w,h,d]);
        translate([-1,-1,24]) cube([w,12,d]);
        translate([-1,-1,11]) cube([12,12,d]);
        
        translate([w+1,19.5,d/2]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([w+1,19.5+150.7,12]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([w+1,19.5+150.7,d-13]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        
        translate([7.5,16.8,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([w-30.2,20,-0.1]) cylinder(d=3,h=10,$fn=20);
        
        translate([10,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([w-15,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);
    }
}


module mock_PSU_240W() {
    w = 110;
    h = 199;
    d = 50;
    
    color("silver") difference() {
        cube([w,h,d]);
        translate([-1,-1,24]) cube([w,12,d]);
        translate([-1,-1,11]) cube([12,12,d]);
        
        translate([w+1,19.5,d/2]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([w+1,19.5+150.7,12]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        translate([w+1,19.5+150.7,d-13]) rotate([0,-90,0]) cylinder(d=3,h=10,$fn=20);
        
        translate([10,61,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([w-15,61,-0.1]) cylinder(d=3,h=10,$fn=20);
        
        translate([10,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);
        translate([w-15,61+126,-0.1]) cylinder(d=3,h=10,$fn=20);
    }
}

mock_PSU_240W();