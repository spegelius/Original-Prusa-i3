use <../../Dollo/NEW_long_ties/include.scad>;


module mock_LM8UU() {
    color("silver") difference() {
        cylinder(d=15,h=24,center=true,$fn=30);
        cylinder(d=8,h=25,center=true,$fn=30);
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

module mock_40mm_fan() {
    difference() {
        translate([0,0,11/2]) rounded_cube_side(40,40,11,3,center=true);
        translate([0,0,-0.1]) cylinder(d=39,h=12,$fn=40);
        for(i=[0:3]) {
            rotate([0,0,i*360/4]) translate([32.5/2,32.5/2,0]) cylinder(d=3.5,h=12,$fn=20);
        }
    }
}

//mock_PSU_240W();
mock_PSU_360W();
//mock_40mm_fan();